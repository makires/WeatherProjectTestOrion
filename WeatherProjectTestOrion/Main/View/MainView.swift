//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
    @State var leftTopPointY: CGFloat = .zero
    @State var startLeftTopPointY: CGFloat = .zero
    @State var heightDetailsCurrentWeatherView: CGFloat = .zero
    
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderWeatherView(leftTopPointY: $leftTopPointY, startLeftTopPointY: $startLeftTopPointY, heightDetailsCurrentWeatherView: $heightDetailsCurrentWeatherView, weatherVM: weatherVM)
                    
                DailyWeatherListView(weatherVM: weatherVM, startLeftTopPointY: $startLeftTopPointY, leftTopPointY: $leftTopPointY, heightDetailsCurrentWeatherView: $heightDetailsCurrentWeatherView)
            }
            .onAppear {
                weatherVM.getCurrentWeather(for: weatherVM.cityTitleStatic)
                weatherVM.getHourlyWeather(for: weatherVM.cityTitleStatic)
                weatherVM.getDailyWeather(for: weatherVM.cityTitleStatic)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
