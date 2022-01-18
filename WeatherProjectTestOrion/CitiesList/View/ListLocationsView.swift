//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
    @StateObject var citiesVM = CitiesListViewModel(weatherService: WeatherService())
    @EnvironmentObject var weatherVM: WeatherViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale.identifier) var locale
    @State var editList = false
    @State var showSearchCities = false
    @State var isShowMainView = false
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 2) {
                        ForEach(citiesVM.arrayWeather) { weather in
                            CityRowView(
                                cityName: weather.cityName,
                                weather: weather,
                                editListCities: $editList,
                                citiesVM: citiesVM)
                                .onTapGesture {
                                    weatherVM.currentCity = weather.cityName
                                    isShowMainView.toggle()
                                }
                        }
                    }
                }
                HStack {
                    Button {
                        showSearchCities.toggle()
                    } label: {
                        Label(Localization.addLocation.localized, systemImage: iconButtonAddLocation)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.leading, 16)
            }
            .fullScreenCover(isPresented: $isShowMainView) {
                MainView()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: iconButtonBackToView)
                            .backToViewButton()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        editList.toggle()
                    } label: {
                        Image(systemName: editList ? iconButtonActivEditList :  iconButtonNotActivEditList)
                            .editListCitiesButton()
                    }
                }
            }
            .fullScreenCover(isPresented: $showSearchCities) {
                SearchCitiesView(citiesVM: citiesVM, weatherVM: _weatherVM)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Localization.locations.localized)
            .onAppear {
                Task {
                    await citiesVM.getCitiesFromAppStorage()
                }
            }
        }
    }

}

struct ListLocationsView_Previews: PreviewProvider {
    @EnvironmentObject static var weatherVM: WeatherViewModel
    static var previews: some View {
        NavigationView {
            ListLocationsView(weatherVM: _weatherVM)
                .environmentObject(WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
