//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
    #warning("если переместить во вьюМодель пересттает считываться локаль, пчм?")
    @Environment(\.locale) var locale
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderWeatherView( weatherVM: weatherVM)
                DailyWeatherListView(weatherVM: weatherVM)
            }
            .onAppear {
                print(locale.identifier)
                Task {
                    #warning("если регион стоит как en_RU, то какой запрос делать?")
                    await weatherVM.getAllWeather(for: weatherVM.cityTitleStatic, locale: locale.identifier.languageResponse)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
