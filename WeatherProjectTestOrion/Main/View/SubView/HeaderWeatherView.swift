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
  var body: some View {
    ZStack {
      GeometryReader { _ in
        Image(Constants.Image.backgroundHeaderWeatherView)
          .resizable()
          .ignoresSafeArea()
          .frame(height: 290)
      }
      GeometryReader { _ in
        VStack(spacing: Constants.Spacing.headerItems) {
          HStack {
            Text(LocalizedStringKey(weatherVM.weatherCurrent.cityName))
              .font(.largeTitle)
              .tracking(0.37)
            Spacer()
            Button {
              citiesVM.getCitiesFromAppStorage()
              showListCities.toggle()
            } label: {
              Image(systemName: Constants.Icon.iconButtonListBullet)
            }
          }
          .padding(.horizontal, .x2)
          CurrentWeatherView(
            weather: weatherVM.weatherCurrent)
            .padding(.horizontal, .x2)
          Spacer()
          if !isScrolled {
            DetailsForCurrentWeatherView(
              weather: weatherVM.weatherCurrent,
              hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
              .fontDesciprionConditionWeather()
              .offset(y: -.x2)
              .padding(.leading, .x2)
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
