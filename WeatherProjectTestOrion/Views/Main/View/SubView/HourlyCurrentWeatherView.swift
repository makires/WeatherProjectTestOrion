//
//  HourlyCurrentWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct HourlyCurrentWeatherView: View {
    var hourlyCurrentWeather: HourlyCurrentWeather
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack {
                    Text(Localization.now.localized)
                    Image(systemName: hourlyCurrentWeather.hours.first?.condition.iconName ?? "")
                        .foregroundColor(.white)
                        .padding(.vertical, MagicNumber.x2)
                    Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
                }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        Image(systemName: hourItem.condition.iconName)
                            .foregroundColor(.white)
                            .padding(.vertical, MagicNumber.x2)
                        Text(hourItem.temperatureCelcius.temperatureConverter)
                    }
                }
            }
        }
    }
}
