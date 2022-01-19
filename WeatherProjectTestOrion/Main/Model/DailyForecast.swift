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
          dateEpoch: 10,
          day: Day(maxTemperatureCelcius: 10,
                   minTemperatureCelcius: 10,
                   condition: ConditionWeather(
                    text: "",
                    iconURL: "",
                    code: 1)),
          hour: [Hour]()))
    }
  }
}
