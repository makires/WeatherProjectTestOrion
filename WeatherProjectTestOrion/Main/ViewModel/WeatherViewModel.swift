//
//  WeatherViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    var cityTitleStatic = "Nizhny Novgorod"
//    var cityTitleStatic = "Sochi" 
    @Published var weatherCurrent = Weather()
    @Published var weatherHourlyCurrent = HourlyCurrentWeather()
    @Published var weatherDailyForecast = DailyForecats()
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    func getAllWeather(for city: String, locale: String) {
        getCurrentWeather(for: city, locale: locale)
        getHourlyWeather(for: city, locale: locale)
        getDailyWeather(for: city, locale: locale)
    }
    // async - await чтобы исключить closure hell
    func getCurrentWeather(for city: String, locale: String) {
        weatherService.fetchCurrentWeather(for: city, locale: locale) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
    func getHourlyWeather(for city: String, locale: String) {
        weatherService.fetchHourlyWeather(for: city, locale: locale) { apiHourlyCurrentWeatherModel in
            self.weatherHourlyCurrent = HourlyCurrentWeather(response: apiHourlyCurrentWeatherModel)
        }
    }
    func getDailyWeather(for city: String, locale: String) {
        weatherService.fetchDailyWeather(for: city, locale: locale) { apiDailyWeatherModel in
            self.weatherDailyForecast = DailyForecats(response: apiDailyWeatherModel)
        }
    }
}
