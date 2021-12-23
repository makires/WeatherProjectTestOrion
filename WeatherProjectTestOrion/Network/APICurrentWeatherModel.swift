//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//
//

import Foundation

struct APICurrentWeatherModel: Decodable {
    let current: APICurrentWeather
}

struct APICurrentWeather: Decodable {
    let temperatureCurrent: Double
    let pressureHPa: Int
    let windKph: Double
    let windDirection: String
    let humidity: Int
    let feelsLikeTemperature: Double
    let condition: ConditionWeather

    enum CodingKeys: String, CodingKey {
        case temperatureCurrent = "temp_c"
        case pressureHPa = "pressure_mb"
        case windKph = "wind_kph"
        case windDirection = "wind_dir"
        case humidity
        case feelsLikeTemperature = "feelslike_c"
        case condition
    }
}

struct ConditionWeather: Decodable {
    let text: String
    let icon: String
}

struct APIForecastWeatherModel: Decodable {
    let forecast: APIForecastWeather
}

struct APIForecastWeather: Decodable {
    let forecastday: [Forecastday]
}

struct Forecastday: Decodable {
    let id = UUID()
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case day
        case hour
    }
}

struct Hour: Decodable, Identifiable {
    let id = UUID()
    let timeEpoch: Int
    let time: String
    let temperatureCelcius: Double
    let condition: ConditionWeather

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case temperatureCelcius = "temp_c"
        case condition
    }
}

struct Day: Decodable {
    let maxTemperatureCelcius: Double
    let minTemperatureCelcius: Double
    let condition: ConditionWeather
    enum CodingKeys: String, CodingKey {
        case maxTemperatureCelcius = "maxtemp_c"
        case minTemperatureCelcius = "mintemp_c"
        case condition
    }
}

extension Int {
    var formattedHour: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

extension Int {
    var formattedDay: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: date)
    }
}

extension Int {
    var formattedNameDay: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}
