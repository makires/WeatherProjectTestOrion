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
    @Environment(\.locale.identifier) var locale
    @Published var weatherCurrent = Weather()
    @Published var weatherHourlyCurrent = HourlyCurrentWeather()
    @Published var weatherDailyForecast = DailyForecats()
    let weatherService: WeatherRepositoryProtocol

    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }

    func getAllWeather() async {
        await getCurrentWeather(for: currentCity, locale: locale.languageResponse)
        await getHourlyWeather(for: currentCity, locale: locale.languageResponse)
        await getDailyWeather(for: currentCity, locale: locale.languageResponse)
    }

    func getCurrentWeather(for city: String, locale: String) async {
        guard let currentWeather =
                await weatherService.fetchCurrentWeather(
                    for: city, locale:
                        locale.languageResponse)
        else { return }
        self.weatherCurrent = Weather(response: currentWeather)
    }

    func getHourlyWeather(for city: String, locale: String) async {
        guard let hourlyWeather = await weatherService.fetchHourlyWeather(for: city, locale: locale) else { return }
        self.weatherHourlyCurrent = HourlyCurrentWeather(response: hourlyWeather)
    }

    func getDailyWeather(for city: String, locale: String) async {
        guard let dailyWeather = await weatherService.fetchDailyWeather(for: city, locale: locale) else { return }
        self.weatherDailyForecast = DailyForecats(response: dailyWeather)
    }
}
