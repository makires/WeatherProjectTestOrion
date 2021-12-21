//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation


struct APIWeatherModel: Decodable {
    let current: APICurrentWeather
    let forecast: APIForecastWeather
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

struct APIForecastWeather: Decodable {
    let forecastday: [Forecastday]
}

struct Forecastday: Decodable {
    
    let hour: [Hour]
    // время
}
struct Hour: Decodable {
    let time: String
    let temperatureCelcius: Double
    let condition: ConditionWeather
    

    enum CodingKeys: String, CodingKey {
        case time
        case temperatureCelcius = "temp_c"
        case condition
    }
}

