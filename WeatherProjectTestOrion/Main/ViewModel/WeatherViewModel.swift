//
//  WeatherViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation
import SwiftUI

@MainActor class WeatherViewModel: ObservableObject {
  @AppStorage("currentCity") var currentCity = "Nizhny Novgorod"
  @Published var weatherCurrent = Weather()
  @Published var weatherHourlyCurrent = HourlyCurrentWeather()
  @Published var weatherDailyForecast = DailyForecats()
  let weatherService: WeatherRepositoryProtocol
  init(weatherService: WeatherRepositoryProtocol) {
    self.weatherService = weatherService
  }
  func getAllWeather(for city: String, locale: String) async {
    await getCurrentWeather(for: city, locale: locale)
    await getHourlyWeather(for: city, locale: locale)
    await getDailyWeather(for: city, locale: locale)
  }
  func getCurrentWeather(for city: String, locale: String) async {
    guard let currentWeather = await weatherService.fetchCurrentWeather(for: city, locale: locale) else {
      print("не удалось получить текущую погоду для города в главнвом экране")
      return
    }
    self.weatherCurrent = Weather(response: currentWeather)
  }
  func getHourlyWeather(for city: String, locale: String) async {
    guard let hourlyWeather = await weatherService.fetchHourlyWeather(for: city, locale: locale) else {
      print("не удалось получить часовой прогноз для города в главнвом экране")
      return
    }
    self.weatherHourlyCurrent = HourlyCurrentWeather(response: hourlyWeather)
  }
  func getDailyWeather(for city: String, locale: String) async {
    guard let dailyWeather = await weatherService.fetchDailyWeather(for: city, locale: locale) else {
      print("не удалось получить прогноз по дням для города в главнвом экране")
      return
    }
    self.weatherDailyForecast = DailyForecats(response: dailyWeather)
  }
}
