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
    var body: some View {
        ZStack {
            // image background
            GeometryReader { _ in
                Image(backgroundHeaderWeatherView)
                    .resizable()
                    .ignoresSafeArea()
//    .frame(height: weatherVM.isScrolled ? 180 : 290)
                    .frame(height: 280)
            }
            // other
            GeometryReader { _ in
                VStack(spacing: spacingItemsHeaderWeatherView) {
                    // cityTitle
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
                    //  HStack - CurrentWeather
                    CurrentWeatherView(weatherVM: weatherVM, weather: weatherVM.weatherCurrent)
                        .padding(.horizontal, 16)
                    // HStack - Details Current Weather
                    Spacer()
                            DetailsForCurrentWeatherView(
                                weather: weatherVM.weatherCurrent,
                                hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
                        .fontDesciprionConditionWeather()
                                .opacity(weatherVM.isScrolled ? 0 : 1)
                                .background(weatherVM.isScrolled ? Color.white : Color.clear)
                                .offset(y: weatherVM.isScrolled ? 0 : -24)
                                .padding(.leading, weatherVM.isScrolled ? 0 : 16)

                }
            }
        }
        .foregroundColor(Color.mainTextWhite)
        .fullScreenCover(isPresented: $showListCities) {
            ListLocationsView()
        }
    }
}

struct SizeHeaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
