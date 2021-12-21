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

    func fetchCurrentWeather(for city: String, completionHandler: @escaping (APIWeatherModel) -> ()) {
        // статичный город
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI
        ]
        print(url)
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: APIWeatherModel.self) { (response) in
                // необходимо APIWeatherModel преобразовать в модель типа Weather,
                // которая используется на уровне бизнес-логики в слое domain
                // как это сделать правильно?
                
                guard let weather = response.value else {
                    print("не удалось распарсить данные, проверить тип данных")
                    return
                }
                print("запрос")
                print(weather.current.temperatureCurrent)
                print(weather.current.feelsLikeTemperature)
                print(weather.current.condition.text)
                
                completionHandler(weather)
            }
    }
    
    
    func fetchHourlyWeather(for city: String, completionHandler: @escaping (APIWeatherModel) -> ()) {
        
    }
}


