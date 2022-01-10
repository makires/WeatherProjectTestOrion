//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
    
    @StateObject var citiesVM = CitiesListViewModel(weatherService: WeatherService())
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale.identifier) var locale
    @State var editList = false
    var body: some View {
        ScrollView {
// temporary ========================
Button("Refresh") {
    citiesVM.citiesData = ["Nizhny Novgorod", "Sochi"].encodeArray()!
    let decoder = JSONDecoder()
    if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesVM.citiesData) {
        citiesVM.citiesList = citiesFromAppStorage
    }
}
            #warning("эту кнопку потом надо оставить")
            Button(Localization.addLocation.localized) {
                Task {
    citiesVM.citiesList.append("Moscow")
                    guard let weather = await citiesVM.weatherService.fetchCurrentWeather(for: "Moscow", locale: locale) else {
                    print("не удалось получить текущую погоду для списка городов")
                    return
                }
                     let newWeatherModel = Weather(response: weather)
                    citiesVM.arrayWeather.append(newWeatherModel)
                    citiesVM.citiesList.append(newWeatherModel.cityName)
                    guard let newCitiesList = citiesVM.citiesList.encodeArray() else {
                        print("не удалось закодировать новый список городов")
                        return
                    }
                    citiesVM.citiesData = newCitiesList
            }
            }

// temporary ========================
//            ForEach(citiesVM.citiesList, id: \.self) { cityName in
//                CityRowView(cityName: cityName, editList: $editList, citiesVM: citiesVM)
//            }
            ForEach(citiesVM.arrayWeather) { weather in
                CityRowView(cityName: weather.cityName, weather: weather, editList: $editList, citiesVM: citiesVM)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editList.toggle()
                } label: {
                    Image(systemName: editList ? "checkmark" :  "square.and.pencil")
                        .foregroundColor(.black)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Localization.locations.localized)

        .onAppear {
            print(locale)
            Task {
                await citiesVM.getCitiesFromAppStorage()
            }
        }
    }
    
    
}

struct ListLocationsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ListLocationsView()
        }
    }
}
