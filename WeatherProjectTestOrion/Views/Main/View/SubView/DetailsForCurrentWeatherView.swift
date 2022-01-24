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
        HStack(spacing: MagicNumber.x8) {
            MeteorologicalDataView(weather: weather)
            HourlyCurrentWeatherView(hourlyCurrentWeather: hourlyCurrentWeather)
        }
    }
}
// separate view
struct HourlyCurrentWeatherView: View {
    var hourlyCurrentWeather: HourlyCurrentWeather
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack {
                    Text(Localization.now.localized)
                    Image(systemName: hourlyCurrentWeather.hours.first?.condition.iconName ?? "")
                        .foregroundColor(.white)
                    //проверить числа можно ли убрать
                        .frame(width: 22, height: 22)
                        .padding(.vertical, MagicNumber.x1)
                    Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
                }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        Image(systemName: hourItem.condition.iconName)
                            .foregroundColor(.white)
                            .frame(width: 22, height: 22)
                            .padding(.vertical, MagicNumber.x1)
                        Text(hourItem.temperatureCelcius.temperatureConverter)
                    }
                }
            }
        }
    }
}
// отдельная вью
struct MeteorologicalDataView: View {
    let weather: Weather
    var body: some View {
        HStack {
            VStack(spacing: MagicNumber.x4) {
                Image(systemName: Icon.iconWind)
                Image(systemName: Icon.iconSafari)
                Image(systemName: Icon.iconDrop)
            }
            VStack(alignment: .leading, spacing: MagicNumber.x4) {
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
