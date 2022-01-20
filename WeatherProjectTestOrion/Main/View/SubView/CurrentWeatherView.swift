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
    HStack {
      VStack(alignment: .leading, spacing: .zero) {
        Text(weather.temperatureCurrent)
          .fontTitleCity()
          .padding(.bottom, .zero)
        HStack(alignment: .top, spacing: .zero) {
          Text(weather.textWeatherCondition)
          Text(Localization.feelsLike.localized)
          Text(weather.feelsLikeTemperature)
        }
        .fontDesciprionConditionWeather()
      }
      Spacer()
      Image(systemName: weather.icon)
        .fontCurrentIcon()
        .foregroundColor(weather.icon == WeatherIcon.clearDay.rawValue ? .yellow : .white)
    }
  }
}
