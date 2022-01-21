//
//  Text+.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 21.01.2022.
//

import Foundation
import SwiftUI

extension Text {
  func dateText() -> some View {
    self
      .tracking(-0.08)
      .foregroundColor(.secondary)
      .modifier(DateWeather())
  }
  func nameDayText() -> some View {
    self
      .tracking(-0.41)
      .foregroundColor(.mainText)
      .modifier(NameDateWeather())
  }
  func minTemperatureText() -> some View {
    self
      .tracking(-0.32)
      .foregroundColor(.subText)
      .modifier(DescriptionWeatherRowListCities())
  }
  func maxTemperatureText() -> some View {
    self
      .tracking(0.35)
      .foregroundColor(.mainText)
      .modifier(DailyWeatherRowModifier())
  }
  func popularCitiesText() -> some View {
    self
      .tracking(-0.41)
      .modifier(PopularCities())
  }
}
