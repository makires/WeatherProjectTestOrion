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
    @State var city = ""
    var searchField: some View {
        HStack {
            HStack(alignment: .center) {
                Image(systemName: iconMagnifyingglass)
                TextField(Localization.search.localized, text: $searchTextFeild)
                    .onSubmit {
                        mapVM.findCity(city: searchTextFeild)
                        searchIsEditing.toggle()
                    }
                if searchIsEditing {
                Button {
                    searchTextFeild = ""
                    searchIsEditing = false
                } label: {
                    Image(systemName: iconButtonDeleteText)
                        .foregroundColor((Color.buttonDeleteTextField))
                }
                .padding(.trailing, 6)
                }
            }
            .padding(.leading, 4)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor((Color.searchBackground)))
        .padding(.horizontal, 16)
            if searchIsEditing {
            Button {
                searchTextFeild = ""
                searchIsEditing = false
            } label: {
                Text(Localization.cancel.localized)
            }
            .padding(.trailing, 16)
            }
        }
    }
    var titleNavigation: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: iconButtonBackToView)
                    .backToViewButton()

            }
            Text(Localization.locations.localized)
            Spacer()
            Button {
                print("plus")
            } label: {
                Image(systemName: iconButtonAdd)
                    .editListCitiesButton()
            }
        }
        .padding(.leading, 6)
        .padding(.trailing, 16)
    }
    var mapView: some View {
        ZStack(alignment: .trailing) {
            GeometryReader { geometry in
                let frame = geometry.frame(in: .named("MAP"))
                
                Map(coordinateRegion: $mapVM.coordinateRegion, showsUserLocation: true, annotationItems: mapVM.annotationsMark) { item in
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
                    SheetBottomWeatherView(cityName: city, showSheet: $showSheet, mapVM: mapVM)
                        VStack {
                            Capsule()
                                .fill(Color.gray)
                                .frame(width: 36, height: 5)
                                .padding(.top, 6)
                        }
                        .frame(alignment: .top)
                    }
                .offset(y: geometry.frame(in: .named("MAP")).height - 150)
            }
            }
            buttonsNavigationMap
            .padding(.trailing, 16)
        }
        .coordinateSpace(name: "MAP")
    }
    var buttonsNavigationMap: some View {
        VStack(spacing: 4) {
            Group {
                Button {
                    MapDetails.defaultSpan
                } label: {
                    Image(systemName: iconPlusCircle)
                }
                Button {
                    print("уменьшить")
                } label: {
                    Image(systemName: iconMinusCircle)
                }
                Button {
                    print("current location")
                } label: {
                    Image(systemName: iconCurrentLocation)
                }
            }
            .font(.largeTitle)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.black, .white)
            .shadow(radius: 2)
        }
    }
    var body: some View {
            VStack {
                if !searchIsEditing {
                    titleNavigation
                }
                searchField
                    .onChange(of: searchTextFeild) { newValue in
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
                                searchIsEditing = false
                                self.city = city
                                showSheet = true
                                mapVM.annotationsMark = []
                                mapVM.findCity(city: city)
                            }
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    Spacer()
                }
            }
    }
}

struct SearchCitiesOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCitiesOnMapView()
    }
}
