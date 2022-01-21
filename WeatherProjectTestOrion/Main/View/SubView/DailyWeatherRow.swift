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
                    .tracking(-0.08)
                    .fontDateWeather()
                    .foregroundColor(.subText)
                Text(dailyForecast.dateEpoch.formattedNameDay)
                    .tracking(-0.41)
                    .foregroundColor(.mainText)
                    .fontNameDateWeather()
            }
            Spacer()
            LazyVGrid(columns: gridItems) {
                Spacer()
                Image(systemName: dailyForecast.day.condition.iconName)
                    .foregroundStyle(
                        dailyForecast.day.condition.iconName == WeatherIcon.clearDay.rawValue ? .yellow : .blue)
                    .font(.system(size: 17))
                // MARK: - через модификатор все tracking"
                Text(dailyForecast.day.maxTemperatureCelcius.temperatureConverter)
                    .tracking(0.35)
                    .foregroundColor(.mainText)
                    .fontDailyWeatherRow()
                Text(dailyForecast.day.minTemperatureCelcius.temperatureConverter)
                    .tracking(-0.32)
                    .foregroundColor(.subText)
                    .fontDescriptionWeatherRowListCities()
            }
        }
        .padding(.vertical, MagicNumber.x2)
        .padding(.horizontal, MagicNumber.x4)
    }
}
