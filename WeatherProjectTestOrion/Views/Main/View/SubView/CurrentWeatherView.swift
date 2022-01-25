//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var weatherVM: WeatherViewModel
    var weather: Weather
    var body: some View {
      VStack {
        HStack {
          Text(weather.temperatureCurrent)
              .fontTitleCity()
              .padding(.bottom, .zero)
          Spacer()
          Image(systemName: weather.icon)
              .fontCurrentIcon()
              .foregroundColor(weather.icon == WeatherIcon.clearDay.rawValue ? .yellow : .white)
        }
        HStack {
          Text(weather.textWeatherCondition + Localization.feelsLike.localized + weather.feelsLikeTemperature)
            .fontDesciprionConditionWeather()
          Spacer()
        }
      }
    }
}
