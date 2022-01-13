//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    @State var showListCities = false
    @Binding var isScrolled: Bool
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(backgroundHeaderWeatherView)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: 290)
            }
            GeometryReader { _ in
                VStack(spacing: spacingItemsHeaderWeatherView) {
                    HStack {
                        Text(LocalizedStringKey(weatherVM.weatherCurrent.cityName))
                            .font(.largeTitle)
                            .tracking(0.37)
                        Spacer()
                        NavigationLink(destination: ListLocationsView()) {

                        }
                        Button {
                            showListCities.toggle()
                        } label: {
                            Image(systemName: iconButtonListBullet)
                        }

                    }
                    .padding(.horizontal, 16)
                    CurrentWeatherView(
                        weatherVM: weatherVM,
                        weather: weatherVM.weatherCurrent)
                        .padding(.horizontal, 16)
                    Spacer()
                    if !isScrolled {
                        DetailsForCurrentWeatherView(
                            weather: weatherVM.weatherCurrent,
                            hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
                            .fontDesciprionConditionWeather()
                            .offset(y: -16)
                            .padding(.leading, 16)
                    }
                }
            }
        }
        .foregroundColor(Color.mainTextWhite)
        .fullScreenCover(isPresented: $showListCities) {
            ListLocationsView()
        }
    }
}
