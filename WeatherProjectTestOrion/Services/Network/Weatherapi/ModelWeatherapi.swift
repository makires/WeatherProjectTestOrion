//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation


struct Weather: Decodable {
    let current: CurrentWeather
}
struct CurrentWeather: Decodable {
    let temperature: Int
    let pressure: Int
    let wind: Double
    let humidity: Int
    let feelslike: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case pressure = "pressure_mb"
        case wind = "wind_kph"
        case humidity
        case feelslike = "feelslike_c"
    }
}
