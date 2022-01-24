//
//  CityViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 30.12.2021.
//

import Foundation
import SwiftUI
@MainActor class CitiesListViewModel: ObservableObject {
    let weatherService: WeatherRepositoryProtocol
    @Published var arrayWeather: [Weather] = []
    @Published var citiesList: [String] = []
    @Environment(\.locale.identifier) var locale
    @AppStorage("cities") var citiesData = [
        "Nizhny Novgorod"].encodeArray()!

    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }

    func getWeatherForCities() async {
        await withTaskGroup(of: Weather.self, body: { group in
            for city in citiesList {
                group.addTask(priority: .utility) {
                    async let apiCurrentWeatherModel =
                    self.weatherService.fetchCurrentWeather(for: city, locale: self.locale.languageResponse)
                    async let apiForecastWeatherModel =
                    self.weatherService.fetchDailyWeather(for: city, locale: self.locale.languageResponse)
                    guard let apiCurrentWeatherModel = await apiCurrentWeatherModel,
                          let apiForecastWeatherModel = await apiForecastWeatherModel else {
                              return Weather() }
                    let newWeather = Weather(responseWeather: apiCurrentWeatherModel,
                                             responseForecast: apiForecastWeatherModel)
                    return newWeather
                }
            }
            for await weatherGroup in group {
                if !arrayWeather.contains(where: { weather in
                    weather.cityName == weatherGroup.cityName
                }) {
                    arrayWeather.append(weatherGroup)
                }
            }
        })
    }

    func getCitiesFromAppStorage() {
        let decoder = JSONDecoder()
        if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
            citiesList = citiesFromAppStorage
        }
    }

    func encodeCitiesToStorage(nameCity: String) {
        let decoder = JSONDecoder()
        guard var citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) else { return }
        if !citiesFromAppStorage.contains(nameCity) {
            citiesFromAppStorage.append(nameCity)
            guard let encodedCities = citiesFromAppStorage.encodeArray() else { return }
            citiesData = encodedCities
        }
    }

    func remove(cityName: String) {
        if let firstIndex = citiesList.firstIndex(of: cityName) {
            let cityForRemoveName: String = citiesList[firstIndex]
            citiesList.remove(at: firstIndex)
            guard let newCitiesList = citiesList.encodeArray() else { return }
            citiesData = newCitiesList
            if let index = arrayWeather.firstIndex(where: { weather in
                cityForRemoveName == weather.cityName
            }) {
                arrayWeather.remove(at: index)
            }
        }
    }
}
