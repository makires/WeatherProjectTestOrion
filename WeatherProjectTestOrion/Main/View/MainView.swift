//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI
struct MainView: View {
    @Environment(\.locale) var locale
    @State var isScrolled = false
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    var body: some View {
        VStack(spacing: spacingItemsMainView) {
            HeaderWeatherView(
                weatherVM: weatherVM,
                isScrolled: $isScrolled)
                .frame(height: isScrolled ? 180 : 280)
            DailyWeatherListView(
                isScrolled: $isScrolled,
                weatherVM: weatherVM)
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
