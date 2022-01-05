//
//  CityViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 30.12.2021.
//

import Foundation
import SwiftUI
class CitiesListViewModel: ObservableObject {
    var cityTitleStatic = "Nizhny Novgorod"
//    var cityTitleStatic = "Sochi"
//    var cityTitleStatic = "Novokuznetsk"
//    var cityTitleStatic = "Prokopyevsk"
    @Published var weatherCurrent = Weather()
    @Published var citiesList: [String] = []
    @AppStorage("cities") var citiesData = ["Nizhny Novgorod", "Sochi"].encodeArray()!
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    
    func getCitiesFromAppStorage() {
        let decoder = JSONDecoder()
        if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
            citiesList = citiesFromAppStorage
        }
        
    }
    func remove(cityName: String) {
        if let firstIndex = citiesList.firstIndex(of: cityName) {
            citiesList.remove(at: firstIndex)
            guard let newCitiesList = citiesList.encodeArray() else {
                print("не удалось закодировать новый список городов")
                return
            }
            citiesData = newCitiesList
        } else {
            print("не удалось найти такой город для удаления")
        }
    }
    
    
    
    func getCurrentWeather(for city: String, locale: String) {
        weatherService.fetchCurrentWeather(for: city, locale: locale) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
    
}
