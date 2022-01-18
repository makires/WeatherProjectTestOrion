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
    @Published var arrayWeather: [Weather] = []
    @Published var citiesList: [String] = []
    @Environment(\.locale.identifier) var locale
    @AppStorage("cities") var citiesData = [
        "Nizhny Novgorod",
        "Kaliningrad",
        "Yekaterinburg",
        "Omsk",
        "Moscow",
        "Saint Petersburg"].encodeArray()!
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }

    func getCitiesFromAppStorage() async {
        let decoder = JSONDecoder()
        if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
            citiesList = citiesFromAppStorage
        }
        await getWeather(for: citiesList)
    }
    func encodeCitiesToStorage(nameCity: String) {
        print("добавить город в массив и закодировать")
        let decoder = JSONDecoder()
        if var citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
            citiesFromAppStorage.append(nameCity)
            guard let encodedCities = citiesFromAppStorage.encodeArray() else { return }
            citiesData = encodedCities
        } else {
            print("не удалось добавить город в хранилище(decode/encode")
        }
    }
    func getWeather(for cities: [String]) async {
        // MARK: - добавить AsyncSequence
        for city in cities {
            guard let apiCurrentWeatherModel = await weatherService.fetchCurrentWeather(
                for: city,
                   locale: locale.languageResponse) else {
                       print("не удалось получитть текущую погоду от сервера в цикле городов")
                       return
                   }
            guard let apiForecastWeatherModel = await weatherService.fetchDailyWeather(
                for: city,
                   locale: locale.languageResponse) else {
                       print("не удалось получитть прогноз по дням от сервера в цикле городов")
                       return
                   }
            let newWeather = Weather(responseWeather: apiCurrentWeatherModel, responseForecast: apiForecastWeatherModel)
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
