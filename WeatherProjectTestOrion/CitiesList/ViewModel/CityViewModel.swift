//
//  CityViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 30.12.2021.
//

import Foundation

class CityViewModel: ObservableObject {
    var cityTitleStatic = "Nizhny Novgorod"
//    var cityTitleStatic = "Sochi"
//    var cityTitleStatic = "Novokuznetsk"
//    var cityTitleStatic = "Prokopyevsk"
    @Published var weatherCurrent = Weather()
    
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    func getCurrentWeather(for city: String, locale: String) {
        weatherService.fetchCurrentWeather(for: city, locale: locale) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
    
}
