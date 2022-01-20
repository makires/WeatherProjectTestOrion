//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
  var weather: Weather
  var hourlyCurrentWeather: HourlyCurrentWeather
  var body: some View {
    HStack(spacing: Constants.Spacing.meteoAndHourlyDetails) {
      MeteorologicalDataView(weather: weather)
      HourlyCurrentWeatherView(hourlyCurrentWeather: hourlyCurrentWeather)
    }
  }
}

struct HourlyCurrentWeatherView: View {
  var hourlyCurrentWeather: HourlyCurrentWeather
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        VStack {
          Text(Localization.now.localized)
          Image(systemName: hourlyCurrentWeather.hours.first?.condition.iconName ?? "")
            .frame(width: 22, height: 22)
            .padding(.vertical, .third)
          Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
        }
        ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
          VStack {
            Text("\(hourItem.timeEpoch.formattedHour)")
            Image(systemName: hourItem.condition.iconName)
              .frame(width: 22, height: 22)
              .padding(.vertical, .third)
            Text(hourItem.temperatureCelcius.temperatureConverter)
          }
        }
      }
    }
  }
}

struct MeteorologicalDataView: View {
  let weather: Weather
  var body: some View {
    HStack {
      VStack(spacing: Constants.Spacing.hourly) {
        Image(systemName: Constants.Icon.iconWind)
        Image(systemName: Constants.Icon.iconSafari)
        Image(systemName: Constants.Icon.iconDrop)
      }
      VStack(alignment: .leading, spacing: Constants.Spacing.hourly) {
        HStack(spacing: .zero) {
          Text(weather.windKph)
          Text(Localization.kmH.localized)
          Text(LocalizedStringKey(weather.windDirection))
            .foregroundColor(.measure)
        }
        HStack(spacing: .zero) {
          Text(weather.pressureHPa)
          Text(Localization.hPa.localized).foregroundColor(.measure)
        }
        HStack(spacing: .zero) {
          Text(weather.humidity)
          Text("%").foregroundColor(.measure)
        }
      }
    }
  }
}
