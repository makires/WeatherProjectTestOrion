//
//  CityViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 30.12.2021.
//

import Foundation
import SwiftUI
@MainActor class CitiesListViewModel: ObservableObject {
  @Published var arrayWeather: [Weather] = []
  @Published var citiesList: [String] = []
  @Environment(\.locale.identifier) var locale
  @AppStorage("cities") var citiesData = [
    "Nizhny Novgorod"].encodeArray()!
  let weatherService: WeatherRepositoryProtocol
  init(weatherService: WeatherRepositoryProtocol) {
    self.weatherService = weatherService
  }
  func citiesFromStorage() -> [String] {
    let decoder = JSONDecoder()
    if let citiesFromStorage = try? decoder.decode([String].self, from: citiesData) {
      return citiesFromStorage
    } else {
      print("не удалось раскодировать хранилище, возврат пустого массива")
      return []
    }
  }
  func getWeatherForCities() async {
    print("список городов для цикла погоды", citiesList)
    for city in citiesList {
      async let apiCurrentWeatherModel = weatherService.fetchCurrentWeather(for: city, locale: locale.languageResponse)
      async let apiForecastWeatherModel = weatherService.fetchDailyWeather(for: city, locale: locale.languageResponse)
      let currentWeatherFromAPI = await apiCurrentWeatherModel
      let forecastWeatherFromAPI = await apiForecastWeatherModel
      guard let currentWeatherFromAPI = currentWeatherFromAPI else {
        print("не удалось создать Weather в цикле гороодов")
        return
      }
      guard let forecastWeatherFromAPI = forecastWeatherFromAPI else {
        return
      }
      let newWeather = Weather(responseWeather: currentWeatherFromAPI, responseForecast: forecastWeatherFromAPI)
      if !self.arrayWeather.contains(where: { weather in
        weather.cityName == newWeather.cityName
      }) {
        self.arrayWeather.append(newWeather)
      }
    }
  }
  func getCitiesFromAppStorage() {
    let decoder = JSONDecoder()
    if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) {
      citiesList = citiesFromAppStorage
        print("раскодировали список городов: \(citiesList) и опубликовали")
    }
  }
  func encodeCitiesToStorage(nameCity: String) {
    print("функция закодировать город")
    let decoder = JSONDecoder()
    guard var citiesFromAppStorage = try? decoder.decode([String].self, from: citiesData) else {
print("не удалось раскодировать хранилище городов")
      return }
    if !citiesFromAppStorage.contains(nameCity) {
      citiesFromAppStorage.append(nameCity)
      guard let encodedCities = citiesFromAppStorage.encodeArray() else { return }
      citiesData = encodedCities
    }
  }
//  func getWeather(for cities: [String]) async {
//    print("запрос погоды в цикле сработал")
//    // MARK: - добавить AsyncSequence
//    for city in cities {
//      guard let apiCurrentWeatherModel = await weatherService.fetchCurrentWeather(
//        for: city,
//           locale: locale.languageResponse) else {
//             print("не удалось получитть текущую погоду от сервера в цикле городов")
//             return
//           }
//      guard let apiForecastWeatherModel = await weatherService.fetchDailyWeather(
//        for: city,
//           locale: locale.languageResponse) else {
//             print("не удалось получитть прогноз по дням от сервера в цикле городов")
//             return
//           }
//      let newWeather = Weather(responseWeather: apiCurrentWeatherModel, responseForecast: apiForecastWeatherModel)
//      self.arrayWeather.append(newWeather)
//    }
//  }
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
    }
  }
}
