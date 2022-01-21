//
//  WeatherProjectTestOrionApp.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

@main
struct WeatherProjectTestOrionApp: App {
    var body: some Scene {
        WindowGroup {
            //      MainView()
            SearchCitiesView()
                .environmentObject(WeatherViewModel(weatherService: WeatherService()))
                .environmentObject(CitiesListViewModel(weatherService: WeatherService()))
        }
    }
}
