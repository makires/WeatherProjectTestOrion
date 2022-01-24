//
//  DescriptionWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct DescriptionWeather: View {
    var weather: Weather
    
    var body: some View {
        HStack {
                Text(Localization.humidity.localized)
                Text(weather.humidity + "%" + " |")
                Text(LocalizedStringKey(weather.windDirection))
                Text("|")
                Text(weather.windKph) + Text(Localization.kmH.localized)
            Spacer()
                Text(weather.minTemperatureCelcius + " / " + weather.maxTemperatureCelcius)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, MagicNumber.x2)
        .padding(.bottom, MagicNumber.x3)
        .fontDesciprionConditionWeather()
        .foregroundColor(.secondary)
    }
}
