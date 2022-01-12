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
        HStack(spacing: spacingItemsDetailsForCurrentWeather) {
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
                            .padding(.vertical, 3)
                        Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
                    }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        Image(systemName: hourItem.condition.iconName)
                            .frame(width: 22, height: 22)
                            .padding(.vertical, 3)
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
            VStack(spacing: spacingItemsHourlyCurrentWeatherView) {
                Image(systemName: iconWind)
                Image(systemName: iconSafari)
                Image(systemName: iconDrop)
            }
            VStack(alignment: .leading, spacing: spacingItemsHourlyCurrentWeatherView) {
                HStack(spacing: spacingItemsMeteorologicalDataView) {
                    Text(weather.windKph)
                    Text(Localization.kmH.localized)
                    Text(LocalizedStringKey(weather.windDirection))
                        .foregroundColor(Color.measure)
                }
                HStack(spacing: spacingItemsMeteorologicalDataView) {
                    Text(weather.pressureHPa)
                    Text(Localization.hPa.localized).foregroundColor(Color.measure)
                }
                HStack(spacing: spacingItemsMeteorologicalDataView) {
                    Text(weather.humidity)
                    Text(symbolPercentage).foregroundColor(Color.measure)
                }
            }
        }
    }
}
