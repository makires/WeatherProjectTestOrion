//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI
struct MainView: View {
    @Environment(\.locale) var locale
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    var body: some View {
        VStack(spacing: spacingItemsMainView) {
            HeaderWeatherView(weatherVM: weatherVM)
                .frame(height: 290)
            DailyWeatherListView(weatherVM: weatherVM)
        }
        .onAppear {
            Task {
                // MARK: - "если регион стоит как en_RU, то какой запрос делать?"
                await weatherVM.getAllWeather(
                    for: weatherVM.cityTitleStatic,
                       locale: locale.identifier.languageResponse)
            }
        }
    }
}
