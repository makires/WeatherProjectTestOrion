//
//  APILocation.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import Foundation

struct Location: Decodable {
    let cityName: String
    let currentLocalTime: String
    let region: String
    let country: String
  
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case currentLocalTime = "localtime"
        case region, country
    }
}
