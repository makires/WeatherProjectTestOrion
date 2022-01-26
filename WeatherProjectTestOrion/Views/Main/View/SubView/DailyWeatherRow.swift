//
//  DailyWeatherRow.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 28.12.2021.
//

import SwiftUI

struct DailyWeatherRow: View {
    let dailyForecast: Forecastday
    let gridItems = [
        GridItem(.fixed(MagicNumber.x2)),
        GridItem(),
        GridItem(.flexible(minimum: Constants.WidthGrid.maxTemperature)),
        GridItem(.flexible(minimum: Constants.WidthGrid.minTemperature), alignment: .trailing)]
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: MagicNumber.x1) {
              Text(dailyForecast.dateEpoch.formattedDay)
                .dateText()
                Text(dailyForecast.dateEpoch.formattedNameDay)
                    .nameDayText()
            }
            Spacer()
            LazyVGrid(columns: gridItems) {
                Spacer()
                Image(systemName: dailyForecast.day.condition.iconName)
                    .foregroundStyle(
                        dailyForecast.day.condition.iconName == WeatherIcon.clearDay.rawValue ? .yellow : .blue)
                Text(dailyForecast.day.maxTemperatureCelcius.temperatureConverter)
                .maxTemperatureText()
                Text(dailyForecast.day.minTemperatureCelcius.temperatureConverter)
                .minTemperatureText()
            }
        }
        .padding(.vertical, MagicNumber.x2)
        .padding(.horizontal, MagicNumber.x4)
    }
}
