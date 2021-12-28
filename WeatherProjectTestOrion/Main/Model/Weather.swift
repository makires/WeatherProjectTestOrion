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
    var text = ""
    var icon = ""
    init() { }
    init(response: APICurrentWeatherModel) {
        cityName = response.location.cityName
        temperatureCurrent = response.current.temperatureCurrent.temperatureConverter
        pressureHPa = String(response.current.pressureHPa)
        windKph = String(response.current.windKph)
        windDirection = response.current.windDirection
        humidity = String(response.current.humidity)
        feelsLikeTemperature = response.current.feelsLikeTemperature.temperatureConverter
        text = response.current.condition.text
        icon = "https:" + response.current.condition.iconURL
    }
}

struct HourlyCurrentWeather {
    var hours: [Hour] = []
    init() { }
    init(response: APIForecastWeatherModel) {
        hours = createCurrentHours(response: response)
    }
    func createCurrentHours(response: APIForecastWeatherModel) -> [Hour] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let currentDate = dateFormatter.date(from: response.location.currentLocalTime) ?? Date()
        var arrayHoursAll: [Hour] = []
        var arrayHoursPublic: [Hour] = []
        arrayHoursAll = response.forecast.forecastday[0].hour
        for hour in arrayHoursAll {
            if Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch)) < currentDate {
                // nothing do, next iteration
            } else if Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch)) >= currentDate {
                arrayHoursPublic.append(hour)
            }
        }
        return arrayHoursPublic
    }
}

struct DailyForecats {
    var days: [Forecastday] = []
    init() {}
    init(response: APIForecastWeatherModel) {
        days = response.forecast.forecastday
    }
}
