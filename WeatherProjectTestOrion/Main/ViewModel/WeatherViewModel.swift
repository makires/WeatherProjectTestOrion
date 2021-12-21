//
//  WeatherViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 18.12.2021.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weatherCurrent = Weather()
    
    let weatherService: WeatherRepositoryProtocol
    
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    
    func getCurrentWeather(for city: String) {
        weatherService.fetchCurrentWeather(for: city) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
    
    func getHourlyWeather(for city: String) {
        
    }
    
}



