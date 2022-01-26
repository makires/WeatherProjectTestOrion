//
//  MainViewBuilder.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 25.01.2022.
//

import SwiftUI

struct MainViewBuilder {
    @MainActor static func view() -> some View {
        let viewModelWeather = WeatherViewModel(weatherService: DIContainer.shared.weatherService)
        let viewModelWeatherCities = CitiesListViewModel(weatherService: DIContainer.shared.weatherService)
        return MainView(weatherVM: viewModelWeather, citiesVM: viewModelWeatherCities)
    }
}
