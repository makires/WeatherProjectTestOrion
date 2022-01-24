//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    @EnvironmentObject var weatherVM: WeatherViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @State var showListCities = false
    @Binding var isScrolled: Bool
    let heightBackground: CGFloat = 290
    var body: some View {
        ZStack {
            GeometryReader { _ in
              Image(weatherVM.weatherCurrent.icon == WeatherIcon.clearDay.rawValue
                    ? Images.sunnyBackgroundHeaderView : Images.cloudyBackgroundHeaderView)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: heightBackground)
            }
            GeometryReader { _ in
                VStack(spacing: MagicNumber.x4) {
                    HStack {
                        Text(LocalizedStringKey(weatherVM.weatherCurrent.cityName))
                            .font(.largeTitle)
                        Spacer()
                        Button {
                            citiesVM.getCitiesFromAppStorage()
                            showListCities.toggle()
                        } label: {
                            Image(systemName: Icon.iconButtonListBullet)
                        }
                    }
                    .padding(.horizontal, MagicNumber.x4)
                    CurrentWeatherView(
                        weather: weatherVM.weatherCurrent)
                        .padding(.horizontal, MagicNumber.x4)
                    Spacer()
                    if !isScrolled {
                        DetailsForCurrentWeatherView(
                            weather: weatherVM.weatherCurrent,
                            hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
                            .fontDesciprionConditionWeather()
                            .offset(y: -MagicNumber.x4)
                            .padding(.leading, MagicNumber.x4)
                    }
                }
            }
        }
        .foregroundColor(.mainTextWhite)
        .fullScreenCover(isPresented: $showListCities) {
            ListLocationsView()
        }
    }
}
