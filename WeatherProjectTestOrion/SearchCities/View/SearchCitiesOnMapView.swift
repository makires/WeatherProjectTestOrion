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
    @Environment(\.presentationMode) var presentationMode
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
        .padding(.leading, MagicNumber.x2)
        .padding(.trailing, MagicNumber.x4)
    }
    var mapView: some View {
        ZStack(alignment: .trailing) {
            GeometryReader { _ in
                Map(coordinateRegion: $mapVM.coordinateRegion,
                    showsUserLocation: true,
                    annotationItems: mapVM.annotationsMark) { item in
                    MapMarker(coordinate: item.coordinate)
                }
                    .ignoresSafeArea(edges: .bottom)
            }
            .onAppear {
                mapVM.checkIfLocationServicesEnabled()
            }
            if showSheet {
                GeometryReader { geometry in
                    ZStack(alignment: .top) {
                        SheetBottomWeatherView(coordinatesCityForNetwork: mapVM.coordinatesCityForNetwork,
                                               showSheet: $showSheet, mapVM: mapVM)
                        VStack {
                            Capsule()
                                .fill(Color.gray)
                                .capsuleStyle()
                        }
                        .frame(alignment: .top)
                    }
                    .offset(y: geometry.frame(in: .named("MAP")).height - 150)
                }
            }
            buttonsNavigationMap
                .padding(.trailing, MagicNumber.x4)
        }
        .coordinateSpace(name: "MAP")
    }
    var buttonsNavigationMap: some View {
        Button {
            mapVM.requestCurrentLocation()
        } label: {
            Image(systemName: Icon.iconCurrentLocation)
        }
        .currentLocationButtonStyle()
    }
    var body: some View {
        VStack {
            if !searchIsEditing {
                titleNavigation
            }
            searchField
                .onChange(of: searchTextFeild) { _ in
                    searchIsEditing = true
                }
            if !searchIsEditing {
                mapView
            }
            if searchIsEditing {
                List(CitiesStorage.citiesStorage.filter({ $0.contains(searchTextFeild)
                }), id: \.self) { city in
                    Text(city)
                        .onTapGesture {
                            self.searchTextFeild = city
                            searchIsEditing = false
                            mapVM.annotationsMark = []
                            Task {
                                await mapVM.findCity(cityName: city)
                            }
                            showSheet = true
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                Spacer()
            }
        }
        .alert(item: $mapVM.showAlertData) { _ in
          Alert(title: Text(mapVM.showAlertData!.title))
        }
    }
}
struct AlertData: Identifiable {
  var id = UUID()
  let title: String
}
