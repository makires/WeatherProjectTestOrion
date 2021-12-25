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
//    var cityTitleStatic = "Novokuznetsk"
//    var cityTitleStatic = "Prokopyevsk"
    // поведение с разными часовыми поясами и отображение с текущим
    // массивом часов (логика с отбрасыванием лишнего часа)
    // при разниице запроса в другой часовой пояс текущее время для
    // отображения массива часов вычисляется на основе Date().
    // на границе полночи отображение другого часов другого часового пояса спешит, следовательно первый элемент повторяет значениие первого элемента другого массива с отброшенным первым значением.
//    var cityTitleStatic = "Sochi"
    @Published var weatherCurrent = Weather()
    @Published var weatherHourlyCurrent = HourlyCurrentWeather()
    @Published var weatherDailyForecast = DailyForecats()
    @Published var leftTopPointScroll: CGFloat = 374
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
