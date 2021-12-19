//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation


struct APIWeatherModel: Decodable {
    let current: APICurrentWeather
//    let location: LocationWeather
}

struct APICurrentWeather: Decodable {
    let temperatureCurrent: Int
    let pressure: Int
    let wind: Double
    let humidity: Int
    let feelsLikeTemperature: Double

    enum CodingKeys: String, CodingKey {
        case temperatureCurrent = "temp_c"
        case pressure = "pressure_mb"
        case wind = "wind_kph"
        case humidity
        case feelsLikeTemperature = "feelslike_c"
    }
}
//struct LocationWeather: Decodable {
//    let name: String
//}
