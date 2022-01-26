//
//  HourlyCurrentWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct HourlyCurrentWeatherView: View {
    var hourlyCurrentWeather: HourlyCurrentWeather
  let frameImage: CGFloat = 24
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack {
                    Text(Localization.now.localized)
                  Image(systemName: hourlyCurrentWeather.hours.first?.condition.iconName ?? WeatherIcon.other.rawValue)
                    .frame(width: frameImage, height: frameImage)
                    .padding(.vertical, MagicNumber.x1)
                        .foregroundColor(.white)
                    Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
                }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        Image(systemName: hourItem.condition.iconName)
                        .frame(width: frameImage, height: frameImage)
                        .padding(.vertical, MagicNumber.x1)
                            .foregroundColor(.white)
                        Text(hourItem.temperatureCelcius.temperatureConverter)
                    }
                }
            }
        }
    }
}
