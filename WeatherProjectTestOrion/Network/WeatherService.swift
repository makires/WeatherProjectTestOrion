//
//  RequestNetwork.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire

// Weatherapi.com


struct WeatherService: WeatherRepositoryProtocol {
    private let keyAPI = "5bfb01e8559d40ac92672846211712"
    private let baseURL = "https://api.weatherapi.com/v1"
    private let currentWeatherAPIMethod = "/current.json?"
    private let forecastWeatherAPIMethod = "/forecast.json"

    func fetchCurrentWeather(for city: String, completionHandler: @escaping (APICurrentWeatherModel) -> ()) {
        // статичный город
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI
        ]
        print(url)
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APICurrentWeatherModel.self) { (response) in
                guard let weather = response.value else {
                    print("не удалось распарсить данные, проверить тип данных")
                    return
                }
                print("текущая погода")
                print(weather.current.temperatureCurrent)
                print(weather.current.feelsLikeTemperature)
//                print(weather.current.condition.text)
                
                completionHandler(weather)
            }
    }
    
    
    func fetchHourlyWeather(for city: String, completionHandler: @escaping (APIHourlyCurrentWeatherModel) -> ()) {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": ""
        ]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APIHourlyCurrentWeatherModel.self) { (response) in
                print(AF.request(url, parameters: parameters))
                guard let forecastHourly = response.value else {
                    print("не удалось распарсить hourly прогноз по часам")
                    return
                }
                
                completionHandler(forecastHourly)
            }
    }
    
    func fetchDailyWeather(for city: String, completionHandler: @escaping (APIDailyForecastWeatherModel) -> ()) {
        let url = baseURL + forecastWeatherAPIMethod
        let parameters: [String: Any] = [
            "q": city,
            "key": keyAPI,
            "days": 5
        ]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APIDailyForecastWeatherModel.self) { (response) in
                guard let forecastDaily = response.value else {
                    print("не удалось распарсить daily прогноз ")
                    return
                }
                
                completionHandler(forecastDaily)
            }
    }
}


