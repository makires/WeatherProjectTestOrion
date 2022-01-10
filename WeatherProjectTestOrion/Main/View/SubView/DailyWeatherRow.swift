//
//  DailyWeatherRow.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 28.12.2021.
//

import SwiftUI

struct DailyWeatherRow: View {
    let dailyForecast: Forecastday
#warning("через константу спэйсинг")
    let gridItems = [GridItem(spacing: 10), GridItem( spacing: 4), GridItem(alignment: .trailing)]
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(dailyForecast.dateEpoch.formattedDay)
                    .foregroundColor(Color("subText"))
                Text(dailyForecast.dateEpoch.formattedNameDay)
                    .foregroundColor(Color("mainText"))
            }
            Spacer()
            HStack {
                LazyVGrid(columns: gridItems) {
                    Image(systemName: dailyForecast.day.condition.iconName)
//                    #warning("тернарный оператор")
                        .foregroundStyle(.blue, .yellow, .blue)
                    Text(dailyForecast.day.maxTemperatureCelcius.temperatureConverter)
//#warning("через модификатор")
                        .tracking(0.35)
//#warning("через енум")
                        .foregroundColor(Color("mainText"))
                        .fontDailyWeatherRow()
                    Text(dailyForecast.day.minTemperatureCelcius.temperatureConverter)
                        .foregroundColor(Color("subText"))
                }
            }
        }
        .padding(.vertical, 8)
//        кратно 8
        .padding(.horizontal, 16)
    }
}
