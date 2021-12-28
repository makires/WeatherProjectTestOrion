//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
    @Environment(\.locale.identifier) var locale
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    var body: some View {
            VStack(spacing: 0) {
                HeaderWeatherView( weatherVM: weatherVM)
                DailyWeatherListView(weatherVM: weatherVM)
            }
            .onAppear {
                weatherVM.getAllWeather(for: weatherVM.cityTitleStatic, locale: locale)
            }
    }
}
