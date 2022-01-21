//
//  WeatherNetworkManagerProtocol.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchCurrentWeather(for city: String, locale: String) async -> APICurrentWeatherModel?
    func fetchHourlyWeather(for city: String, locale: String) async -> APIForecastWeatherModel?
    func fetchDailyWeather(for city: String, locale: String) async -> APIForecastWeatherModel?
}

protocol WeatherRepositoryCoordinatesProtocol {
    func fetchCurrentWeatherByCoordinates(for city: String, locale: String) async -> APICurrentWeatherModel?
}
