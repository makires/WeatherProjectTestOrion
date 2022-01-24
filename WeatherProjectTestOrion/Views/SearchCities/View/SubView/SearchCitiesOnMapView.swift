//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI
import MapKit
struct SearchCitiesOnMapView: View {
    @StateObject var mapVM = MapViewModel(weatherService: WeatherService())
    @State var searchTextFeild = ""
    @State var searchIsEditing = false
    @State var showSheet = false
    @State var changedHeight: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    // вынести все вар в сабьвью
    var searchField: some View {
        HStack {
            HStack {
                Image(systemName: Icon.iconMagnifyingglass)
                TextField(Localization.search.localized, text: $searchTextFeild)
                    .onTapGesture {
                        searchIsEditing = true
                    }
                    .onSubmit {
                        Task {
                            await mapVM.findCity(cityName: searchTextFeild)
                        }
                        showSheet = true
                        searchIsEditing.toggle()
                    }
                if searchIsEditing {
                    Button {
                        searchTextFeild = ""
                        searchIsEditing = false
                    } label: {
                        Image(systemName: Icon.iconButtonDeleteText)
                            .foregroundColor(.buttonDeleteTextField)
                    }
                    .padding(.trailing, MagicNumber.x2)
                }
            }
            .padding(.leading, MagicNumber.x1)
            .padding(.vertical, MagicNumber.x2)
            .background(
                RoundedRectangle(cornerRadius: MagicNumber.x2)
                    .foregroundColor(.searchBackground))
            .padding(.horizontal, MagicNumber.x4)
            if searchIsEditing {
                Button {
                    searchTextFeild = ""
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(Localization.cancel.localized)
                }
                .padding(.trailing, MagicNumber.x4)
            }
        }
    }
    var titleNavigation: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: Icon.iconButtonBackToView)
                    .backToViewButton()
            }
            Text(Localization.locations.localized)
            Spacer()
        }
        .padding(.horizontal, MagicNumber.x4)
    }
    var mapView: some View {
        ZStack {
            Map(coordinateRegion: $mapVM.coordinateRegion,
                showsUserLocation: true,
                annotationItems: mapVM.annotationsMark) { item in
                MapMarker(coordinate: item.coordinate)
            }
            buttonsNavigationMap
                .padding(.trailing, MagicNumber.x4)
            Text("\(changedHeight)").font(.largeTitle) // удалить после теста
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            mapVM.checkIfLocationServicesEnabled()
        }
    }
    var buttonsNavigationMap: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    mapVM.requestCurrentLocation()
                } label: {
                    Image(systemName: Icon.iconCurrentLocation)
                }
                .currentLocationButtonStyle()
            }
            Spacer()
        }
    }
    var listCities: some View {
        VStack {
            List(CitiesStorage.citiesStorage.filter({ $0.contains(searchTextFeild)
            }), id: \.self) { city in
                Text(city)
                    .onTapGesture {
                        self.searchTextFeild = city
                        mapVM.annotationsMark = []
                        Task {
                            await mapVM.findCity(cityName: city)
                        }
                    }
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            Spacer()
        }
    }
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { dragValue in
                self.changedHeight = dragValue.location.y
                print(dragValue.translation)

            }
            .onEnded { dragValue in
                if self.changedHeight > 170 {
                    showSheet = false
                    changedHeight = .zero
                }

                print(dragValue, "end")
            }
    }
    @State var heightSheet: CGFloat = 0.0
    var body: some View {
        VStack {
            if !searchIsEditing {
                titleNavigation
            }
            searchField
                .onChange(of: searchTextFeild) { _ in
                    showSheet = true
                    searchIsEditing = true
                }
            if !searchIsEditing {
                ZStack(alignment: .bottom) {
                    mapView
                    if showSheet {
                        SheetBottomWeatherView(
                            coordinatesCityForNetwork: mapVM.coordinatesCityForNetwork,
                            showSheet: $showSheet,
                            mapVM: mapVM
                        )
                            .frame(height: 190)
                        // чтотбы скрыть значение = 190
                            .offset(y: changedHeight < 0 ? 0 : changedHeight)
                            .gesture(dragGesture)
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                .coordinateSpace(name: "MAP")
            } else {
                listCities
            }
        }
        .alert(item: $mapVM.showAlertData) { _ in
            Alert(title: Text(mapVM.showAlertData!.title))
        }
    }
}
// в папку shared alerts
struct AlertData: Identifiable {
    var id = UUID()
    let title: String
}
// too
struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
