//
//  APIForecast.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import Foundation

struct APIForecastWeatherModel: Decodable {
    let forecast: APIForecastWeather
    let location: Location
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
