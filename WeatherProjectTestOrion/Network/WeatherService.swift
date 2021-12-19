//
//  RequestNetwork.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire

// Weatherapi.com
let keyAPI = "5bfb01e8559d40ac92672846211712"
let baseURL = "https://api.weatherapi.com/v1"
let currentWeatherAPIMethod = "/current.json?"
let forecastWeatherAPIMethod = "/forecast.json"

struct WeatherService: WeatherRepositoryProtocol {

   
    func fetchCurrentWeather(for city: String, completionHandler: @escaping (APIWeatherModel) -> () ) {
        // статичный город
        let url = baseURL + currentWeatherAPIMethod
        let parameters = [
            "q": city,
            "key": keyAPI
        ]
        
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
                print(weather.current.temperatureCurrent)
                print(weather.current.feelsLikeTemperature)
                
                completionHandler(weather)
            }
    }
}


