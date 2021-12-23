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
    func getAllWeather(for city: String) {
        getCurrentWeather(for: city)
        getHourlyWeather(for: city)
        getDailyWeather(for: city)
    }
    // async - await чтобы исключить closure hell
    func getCurrentWeather(for city: String) {
        weatherService.fetchCurrentWeather(for: city) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
    func getHourlyWeather(for city: String) {
        weatherService.fetchHourlyWeather(for: city) { apiHourlyCurrentWeatherModel in
            self.weatherHourlyCurrent = HourlyCurrentWeather(response: apiHourlyCurrentWeatherModel)
        }
    }
    func getDailyWeather(for city: String) {
        weatherService.fetchDailyWeather(for: city) { apiDailyWeatherModel in
            self.weatherDailyForecast = DailyForecats(response: apiDailyWeatherModel)
        }
    }
}
