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
    @ObservedObject var weatherVM: WeatherViewModel
    @ObservedObject var citiesVM: CitiesListViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HeaderWeatherView(
                isScrolled: $isScrolled)
                .frame(height: isScrolled ? minHeight : maxHeight)
                .animation(.easeOut(duration: 0.3), value: isScrolled)
                .environmentObject(weatherVM)
                .environmentObject(citiesVM)
            DailyWeatherListView(
                isScrolled: $isScrolled)
                .environmentObject(weatherVM)
        }
        .onAppear {
            Task {
                await weatherVM.getAllWeather()
            }
        }
    }
}
