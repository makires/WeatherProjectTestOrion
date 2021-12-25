//
//  RequestNetwork.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire
import SwiftUI

// Weatherapi.com

struct WeatherService: WeatherRepositoryProtocol {
    private let keyAPI = "5bfb01e8559d40ac92672846211712"
    private let baseURL = "https://api.weatherapi.com/v1"
    private let currentWeatherAPIMethod = "/current.json?"
    private let forecastWeatherAPIMethod = "/forecast.json"

    func fetchCurrentWeather(for city: String,
                             locale: String,
                             completionHandler: @escaping (APICurrentWeatherModel) -> Void) {
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI,
            "lang": locale
        ]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APICurrentWeatherModel.self) { (response) in
                guard let weather = response.value else {
                    print("не удалось распарсить Current Weather")
                    return
                }
                completionHandler(weather)
            }
    }
    func fetchHourlyWeather(for city: String,
                            locale: String,
                            completionHandler: @escaping (APIForecastWeatherModel) -> Void) {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": "",
            "lang": locale
        ]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APIForecastWeatherModel.self) { (response) in
                guard let forecastHourly = response.value else {
                    print("не удалось распарсить hourly прогноз по часам")
                    return
                }
                completionHandler(forecastHourly)
            }
    }
    func fetchDailyWeather(for city: String,
                           locale: String,
                           completionHandler: @escaping (APIForecastWeatherModel) -> Void) {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": 5,
            "lang": locale
        ]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APIForecastWeatherModel.self) { (response) in
                guard let forecastDaily = response.value else {
                    print("не удалось распарсить daily прогноз ")
                    return
                }
                completionHandler(forecastDaily)
            }
    }
}
