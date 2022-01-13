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
        GridItem(.fixed(8)),
        GridItem(),
        GridItem(.flexible(minimum: widthGridItemMaxTemperature)),
        GridItem(alignment: .trailing)]
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: spacingDateAndNameDayInDailyWeather) {
                Text(dailyForecast.dateEpoch.formattedDay)
                    .tracking(-0.08)
                    .fontDateWeather()
                    .foregroundColor(Color.subText)
                Text(dailyForecast.dateEpoch.formattedNameDay)
                    .tracking(-0.41)
                    .foregroundColor(Color.mainText)
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
                        .foregroundColor(Color.mainText)
                        .fontDailyWeatherRow()
                    Text(dailyForecast.day.minTemperatureCelcius.temperatureConverter)
                        .tracking(-0.32)
                        .foregroundColor(Color.subText)
                        .fontDescriptionWeatherRowListCities()
                }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}
