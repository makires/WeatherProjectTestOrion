//
//  DailyForecast.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import Foundation

struct DailyForecats {
    var days: [Forecastday] = []
}
extension DailyForecats {
    init(response: APIForecastWeatherModel) {
        days = response.forecast.forecastday
    }
}
