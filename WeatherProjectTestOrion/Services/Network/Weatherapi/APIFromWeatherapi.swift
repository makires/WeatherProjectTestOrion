//
//  APIFromWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation

// Weatherapi.com

//KEY
let keyFromWeatherapi = "5bfb01e8559d40ac92672846211712"
//BaseURL
//NOTE без https будет ошибка в Alamofire
let baseUrlWeatherapi = "https://api.weatherapi.com/v1"
// API methods
let currentWeatherFromWeatherapi = "/current.json?"

// request parameters

let cityWeatherapi = "Nizhny_Novgorod"
let testUrl = "\(baseUrlWeatherapi)\(currentWeatherFromWeatherapi)q=\(cityWeatherapi)&key=\(keyFromWeatherapi)"



