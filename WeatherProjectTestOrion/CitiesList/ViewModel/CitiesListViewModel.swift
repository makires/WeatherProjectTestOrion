//
//  CityViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 30.12.2021.
//

import Foundation
import SwiftUI
@MainActor class CitiesListViewModel: ObservableObject {
    var cityTitleStatic = "Nizhny Novgorod"
//    var cityTitleStatic = "Sochi"
//    var cityTitleStatic = "Novokuznetsk"
//    var cityTitleStatic = "Prokopyevsk"
    @Published var arrayWeather: [Weather] = []
    @Published var citiesList: [String] = []
    @Environment(\.locale.identifier) var locale
    @AppStorage("cities") var citiesData = ["Nizhny Novgorod", "Sochi"].encodeArray()!
    
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    
    func getCitiesFromAppStorage() async {
        let decoder = JSONDecoder()
        if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
            citiesList = citiesFromAppStorage
        }
        print("текущий список городов из хранилища", citiesList)
        await getWeather(for: citiesList)
    }
    func getWeather(for cities: [String]) async {
        print("request несколько вызовов в сеть по городам", cities)
        #warning("почитать про AsyncSequence?")
        for city in cities {
            guard let apiCurrentWeatherModel = await weatherService.fetchCurrentWeather(for: city, locale: locale.languageResponse) else { print("не удалось получитть текущую погоду от сервера в цикле городов")
                return
            }
            let newWeather = Weather(response: apiCurrentWeatherModel)
            self.arrayWeather.append(newWeather)
        }
    }
    func remove(cityName: String) {
        if let firstIndex = citiesList.firstIndex(of: cityName) {
            let cityForRemoveName: String = citiesList[firstIndex]
            citiesList.remove(at: firstIndex)
            guard let newCitiesList = citiesList.encodeArray() else {
                print("не удалось закодировать новый список городов")
                return
            }
            citiesData = newCitiesList
            if let index = arrayWeather.firstIndex(where: { weather in
                cityForRemoveName == weather.cityName
            }) {
                arrayWeather.remove(at: index)
            }
        } else {
            print("не удалось найти такой город для удаления")
        }
    }
    
}
