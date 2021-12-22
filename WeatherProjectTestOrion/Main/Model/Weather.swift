//
//  Weather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 21.12.2021.
//

import Foundation

struct Weather {
    var temperatureCurrent = ""
    var pressureHPa  = ""
    var windKph  = ""
    var windDirection = ""
    var humidity  = ""
    var feelsLikeTemperature  = ""
    
    var text = ""
    var icon = ""
    
    init() { }
    
    init(response: APICurrentWeatherModel) {
        temperatureCurrent = String(format: "%.0f", response.current.temperatureCurrent)
        pressureHPa = String(response.current.pressureHPa)
        windKph = String(response.current.windKph)
        windDirection = response.current.windDirection
        humidity = String(response.current.humidity)
        feelsLikeTemperature = String(format: "%.0f", response.current.feelsLikeTemperature)
        text = response.current.condition.text
        icon = "https:" + response.current.condition.icon
    }
    
}

struct HourlyCurrentWeather {
    var hours: [Hour] = []
    var time = ""
    var icon = ""
    var temperatureCelcius = ""
    init() { }
    init(response: APIHourlyCurrentWeatherModel) {
        icon = response.forecast
    }
}


