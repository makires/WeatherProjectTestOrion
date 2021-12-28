//
//  WeatherNetworkManagerProtocol.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchCurrentWeather(for city: String,
                             locale: String,
                             completionHandler: @escaping (APICurrentWeatherModel) -> Void)
    func fetchHourlyWeather(for city: String,
                            locale: String,
                            completionHandler: @escaping (APIForecastWeatherModel) -> Void)
    func fetchDailyWeather(for city: String,
                           locale: String,
                           completionHandler: @escaping (APIForecastWeatherModel) -> Void)
}
