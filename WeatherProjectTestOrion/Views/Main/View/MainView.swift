//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI
struct MainView: View {
    let minHeight: CGFloat = 180
    let maxHeight: CGFloat = 280
    @State var isScrolled = false
    @EnvironmentObject var weatherVM: WeatherViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel
    var body: some View {
        VStack(spacing: .zero) {
            HeaderWeatherView(
                isScrolled: $isScrolled)
                .frame(height: isScrolled ? minHeight : maxHeight)
                .animation(.easeOut(duration: 0.3), value: isScrolled)
            DailyWeatherListView(
                isScrolled: $isScrolled)
        }
        .onAppear {
            Task {
                await weatherVM.getAllWeather()
            }
        }
    }
}
