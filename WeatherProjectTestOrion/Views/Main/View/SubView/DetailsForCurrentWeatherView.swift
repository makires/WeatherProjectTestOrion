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
