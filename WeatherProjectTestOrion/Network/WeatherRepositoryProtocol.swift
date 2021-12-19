//
//  WeatherNetworkManagerProtocol.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation
// уровень domain
// так как источников данных может быть много, на уровне бизнес-логики необходмио
// описать интерфейс для взаимодействия с этим источником данных,
// а не сам источник данных

protocol WeatherRepositoryProtocol {
    
    func fetchCurrentWeather(for city: String, completionHandler: @escaping (APIWeatherModel) -> () )
    
}
