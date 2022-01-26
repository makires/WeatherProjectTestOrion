//
//  DIContainer.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 25.01.2022.
//

import Foundation

struct DIContainer {
    static let shared = DIContainer()
    let weatherService =  WeatherService()
}
