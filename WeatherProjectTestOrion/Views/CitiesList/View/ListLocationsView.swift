//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var editList = false
    @State var showAddCity = false
    @State var showMainView = false
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: MagicNumber.x05) {
                        ForEach(citiesVM.arrayWeather) { weather in
                            CityRowView(
                                cityName: weather.cityName,
                                weather: weather,
                                editListCities: $editList)
                                .onTapGesture {
                                    weatherVM.currentCity = weather.cityName
                                    showMainView.toggle()
                                }
                        }
                    }
                }
                HStack {
                    Button {
                        showAddCity.toggle()
                    } label: {
                        Label(Localization.addLocation.localized, systemImage: Icon.iconButtonAddLocation)
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.leading, MagicNumber.x4)
                .padding(.bottom, MagicNumber.x2)
            }
            .fullScreenCover(isPresented: $showMainView) {
                MainView()
            }
            .fullScreenCover(isPresented: $showAddCity) {
                SearchCitiesView()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: Icon.iconButtonBackToView)
                            .backToViewButton()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        editList.toggle()
                    } label: {
                        Image(systemName: editList ? Icon.iconButtonActivEditList :  Icon.iconButtonNotActivEditList)
                            .editListCitiesButton()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Localization.locations.localized)
            .onAppear {
                Task {
                    await citiesVM.getWeatherForCities()
                }
            }
        }
    }
}
