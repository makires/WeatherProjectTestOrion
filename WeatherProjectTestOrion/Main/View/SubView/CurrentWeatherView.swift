//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    var weather: Weather
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(weather.temperatureCurrent)
                    .fontTitleCity()
                    .padding(.bottom, 0)
                HStack(alignment: .top, spacing: 0) {
                    Text(weather.textWeatherCondition)
                    Text(Localization.feelsLike.localized)
                    Text(weather.feelsLikeTemperature)
                }
                .fontDesciprionConditionWeather()
            }
            Spacer()
            Image(systemName: weather.icon)
                .fontCurrentIcon()
        }
    }
}
