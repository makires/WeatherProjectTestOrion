//
//  IconAndCurrentTemperature.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct IconAndCurrentTemperature: View {
    var weather: Weather
    let maxWidth: CGFloat = 120
    let gridItems = [GridItem()]
    var body: some View {
        LazyHGrid(rows: gridItems, spacing: MagicNumber.x1) {
            Image(systemName: weather.icon)
                .font(.title)
                .foregroundColor(weather.icon == WeatherIcon.clearDay.rawValue ? .yellow : .iconWeatherCityRow)
            Spacer()
            Text(weather.temperatureCurrent)
        }
        .frame(maxWidth: maxWidth, alignment: .leading)
        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, MagicNumber.x1)
    }
}
