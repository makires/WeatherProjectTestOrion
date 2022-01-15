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
    @EnvironmentObject var weatherVM: WeatherViewModel
    var body: some View {
        VStack(spacing: spacingItemsMainView) {
            HeaderWeatherView(
                weatherVM: _weatherVM,
                isScrolled: $isScrolled)
                .frame(height: isScrolled ? 180 : 280)
            DailyWeatherListView(
                isScrolled: $isScrolled,
                weatherVM: _weatherVM)
        }
        .onAppear {
            print("MAIN VIEW")
            print("город", weatherVM.currentCity)
            Task {
                // MARK: - "если регион стоит как en_RU, то какой запрос делать?"
                await weatherVM.getAllWeather(
                    for: weatherVM.currentCity,
                       locale: locale.identifier.languageResponse)
            }
        }
    }
}
