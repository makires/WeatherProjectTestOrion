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
        for _ in 0..<10 {
            days.append(
                Forecastday(
                    dateEpoch: .random(in: 2643024282..<3643024282),
                    day: Day(maxTemperatureCelcius: .random(in: (0..<30)),
                             minTemperatureCelcius: .random(in: (0..<30)),
                             condition: ConditionWeather(
                                text: "",
                                code: 1001)),
                    hour: [Hour]()))
        }
    }
}
