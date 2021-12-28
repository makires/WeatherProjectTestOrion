//
//  Weather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 21.12.2021.
//

import Foundation

struct Weather {
    var cityName = ""
    var temperatureCurrent = ""
    var pressureHPa  = ""
    var windKph  = ""
    var windDirection = ""
    var humidity  = ""
    var feelsLikeTemperature  = ""
    var textWeatherCondition = ""
    var icon = ""
}
extension Weather {
    init(response: APICurrentWeatherModel) {
        cityName = response.location.cityName
        temperatureCurrent = response.current.temperatureCurrent.temperatureConverter
        pressureHPa = String(response.current.pressureHPa)
        windKph = String(response.current.windKph)
        windDirection = response.current.windDirection.rawValue
        humidity = String(response.current.humidity)
        feelsLikeTemperature = response.current.feelsLikeTemperature.temperatureConverter
        textWeatherCondition = response.current.condition.text
        icon = "https:" + response.current.condition.iconURL
    }
}

struct DailyForecats {
    var days: [Forecastday] = []
}
extension DailyForecats {
    init(response: APIForecastWeatherModel) {
        days = response.forecast.forecastday
    }
}
