//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI
struct MainView: View {
  @State var isScrolled = false
  @EnvironmentObject var weatherVM: WeatherViewModel
  @EnvironmentObject var citiesVM: CitiesListViewModel
  var body: some View {
    VStack(spacing: spacingItemsMainView) {
      HeaderWeatherView(
        isScrolled: $isScrolled)
        .frame(height: isScrolled ? 180 : 280)
        .animation(.easeOut(duration: 0.3), value: isScrolled)
      DailyWeatherListView(
        isScrolled: $isScrolled)
    }
    .onAppear {
      print("текущий город на главном экране", weatherVM.currentCity)
      print("список городов", citiesVM.citiesList)
      Task {
        // MARK: - "если регион стоит как en_RU, то какой запрос делать?"
        await weatherVM.getAllWeather()
      }
    }
  }
}
