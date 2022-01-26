//
//  Weather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 21.12.2021.
//

import Foundation

struct Weather: Identifiable {
    let id = UUID()
    var cityName = ""
    var temperatureCurrent = ""
    var pressureHPa  = ""
    var windKph  = ""
    var windDirection = ""
    var humidity  = ""
    var feelsLikeTemperature  = ""
    var textWeatherCondition = ""
    var icon = WeatherIcon.other.rawValue
    var region = ""
    var country = ""
    var minTemperatureCelcius = ""
    var maxTemperatureCelcius = ""
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
        icon = response.current.condition.iconName
        region = response.location.region
        country = response.location.country
    }
}

extension Weather {
    init(responseWeather: APICurrentWeatherModel, responseForecast: APIForecastWeatherModel) {
        cityName = responseWeather.location.cityName
        temperatureCurrent = responseWeather.current.temperatureCurrent.temperatureConverter
        pressureHPa = String(responseWeather.current.pressureHPa)
        windKph = String(responseWeather.current.windKph)
        windDirection = responseWeather.current.windDirection.rawValue
        humidity = String(responseWeather.current.humidity)
        feelsLikeTemperature = responseWeather.current.feelsLikeTemperature.temperatureConverter
        textWeatherCondition = responseWeather.current.condition.text
        icon = responseWeather.current.condition.iconName
        region = responseWeather.location.region
        country = responseWeather.location.country
        minTemperatureCelcius =
        responseForecast.forecast.forecastday.first?.day.minTemperatureCelcius.temperatureConverter ?? ""
        maxTemperatureCelcius =
        responseForecast.forecast.forecastday.first?.day.maxTemperatureCelcius.temperatureConverter ?? ""
    }
}
