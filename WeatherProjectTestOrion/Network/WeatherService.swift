//
//  RequestNetwork.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire
import SwiftUI

struct WeatherService: WeatherRepositoryProtocol, WeatherRepositoryCoordinatesProtocol {

    private let keyAPI = "5bfb01e8559d40ac92672846211712"
    private let baseURL = "https://api.weatherapi.com/v1"
    private let currentWeatherAPIMethod = "/current.json?"
    private let forecastWeatherAPIMethod = "/forecast.json"

    func fetchCurrentWeatherByCoordinates(for city: String,
                                          locale: String) async -> APICurrentWeatherModel? {
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI,
            "lang": locale
        ]
        do {
            let weather = try await AF.request(url, method: .get, parameters: parameters)
                .validate()
                .serializingDecodable(APICurrentWeatherModel.self).value
            return weather
        } catch { return nil }
    }

    func fetchCurrentWeather(for city: String,
                             locale: String) async -> APICurrentWeatherModel? {
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI,
            "lang": locale
        ]
        do {
            let weather = try await AF.request(url, method: .get, parameters: parameters)
                .validate()
                .serializingDecodable(APICurrentWeatherModel.self).value
            return weather
        } catch { return nil }
    }

    func fetchHourlyWeather(for city: String,
                            locale: String) async -> APIForecastWeatherModel? {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": "",
            "lang": locale
        ]
        do {
            let forecast = try await AF.request(url, method: .get, parameters: parameters)
                .validate()
                .serializingDecodable(APIForecastWeatherModel.self).value
            return forecast
        } catch { return nil }
    }

    func fetchDailyWeather(for city: String,
                           locale: String) async -> APIForecastWeatherModel? {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": 5,
            "lang": locale
        ]
        do {
            let forecastDaily = try await AF.request(url, method: .get, parameters: parameters)
                .validate()
                .serializingDecodable(APIForecastWeatherModel.self).value
            return forecastDaily
        } catch { return nil }
    }
}
