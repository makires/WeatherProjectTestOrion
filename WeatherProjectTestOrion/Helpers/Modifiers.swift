//
//  Modifiers +Extension.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 31.12.2021.
//

import SwiftUI

struct TitleCity: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 80, weight: .thin))
  }
}
struct TitleCitySheet: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 17, weight: .regular))
  }
}
struct CurrentIcon: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 78))
  }
}
struct PopularCities: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 17, weight: .semibold))
  }
}
struct BackMainViewButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.black)
      .font(.system(size: 18))
  }
}
struct EditListCitiesButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.black)
      .font(.system(size: 16))
  }
}
struct DescriptionConditionWeather: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 12, weight: .regular))
  }
}
struct DateWeather: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 13, weight: .regular))
  }
}
struct NameDateWeather: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 17, weight: .regular))
  }
}
struct DailyWeatherRowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 22, weight: .regular))
  }
}
struct TemperatureCurrentRowListCities: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 34, weight: .regular))
  }
  
}
struct TemperatureCurrentForSheetCity: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 34, weight: .regular))
  }
  
}
struct IconCurrentWeatherForSheetCity: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 24, weight: .regular))
  }
  
}
struct DescriptionWeatherRowListCities: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 16, weight: .regular))
  }
}
