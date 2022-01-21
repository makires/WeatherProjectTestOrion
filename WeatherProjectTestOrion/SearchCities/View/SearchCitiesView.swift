//
//  SearchCitiesView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI

struct SearchCitiesView: View {
    func changeCurrentCity(city: String) {
        weatherVM.currentCity = city
        citiesVM.encodeCitiesToStorage(nameCity: city)
        isShowMainView.toggle()
    }
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    @State var searchCity = ""
    @State var showMap = false
    @State var isEditing = false
    @State var isShowMainView = false
    var body: some View {
        VStack(alignment: .leading) {
            SearchFieldView(
                searchCity: $searchCity,
                isEditing: $isEditing)
            .padding(.horizontal, MagicNumber.x4)
            Divider()
            .foregroundColor(.primary)
            if !isEditing {
                Group {
                    VStack {
                        HStack {
                            Text(Localization.popularCities.localized)
                                .popularCitiesText()
                            Spacer()
                        }
                    }
                    .padding(.top, MagicNumber.x2)
                    VStack(alignment: .leading, spacing: MagicNumber.x4) {
                        HStack {
                            HStack {
                                Text(weatherVM.currentCity)
                                    .foregroundColor(.currentLocation)
                                Image(Images.imageMapPin)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: MagicNumber.x4)
                            }
                            .popularCitiesStyle()
                            .onTapGesture {
                                isShowMainView.toggle()
                            }
                            ForEach(0..<2, id: \.self) { index in
                                Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                                    .popularCitiesStyle()
                                    .onTapGesture {
                                        changeCurrentCity(city: PopularCitiesStorage.storage[index])
                                    }
                            }
                        }
                        HStack {
                            ForEach(2..<5, id: \.self) { index in
                                Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                                    .popularCitiesStyle()
                                    .onTapGesture {
                                        changeCurrentCity(city: PopularCitiesStorage.storage[index])
                                    }
                            }
                        }
                    }
                    .padding(.vertical, MagicNumber.x4)
                    Divider()
                    .foregroundColor(.primary)
                    HStack {
                        Button {
                            showMap.toggle()
                        } label: {
                            Text(Localization.showMap.localized)
                                .foregroundColor(.currentLocation)
                        }
                        .fullScreenCover(isPresented: $showMap) {
                            SearchCitiesOnMapView()
                        }
                        Spacer()
                    }
                    .padding(.top, MagicNumber.x4)
                }
                .padding(.horizontal, MagicNumber.x4)
            } else {
                List(CitiesStorage.citiesStorage.filter({ $0.contains(searchCity) }), id: \.self) { city in
                    Text(city)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            changeCurrentCity(city: city)
                        }
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowMainView) {
            MainView()
        }
    }
}
struct SearchFieldView: View {
    @Binding var searchCity: String
    @Binding var isEditing: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: Icon.iconButtonBackToView)
                    .backToViewButton()
            }
            TextField(
                Localization.enterLocation.localized,
                text: $searchCity)
                .onTapGesture {
                    isEditing = true
                }
            Button {
                searchCity = ""
            } label: {
                Image(systemName: Icon.iconButtonDelete)
                    .padding(MagicNumber.x2)
                    .editListCitiesButton()
            }
        }
    }
}
