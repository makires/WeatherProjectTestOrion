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
            VStack(alignment: .leading) {
                Text(weather.temperatureCurrent)
                    .fontTitleCity()
                HStack(alignment: .top, spacing: 0) {
                    Text(weather.textWeatherCondition)
                    Text(Localization.feelsLike.localized)
                    Text(weather.feelsLikeTemperature)
                }
                .fontDesciprion()
            }
            Spacer()
            Image(systemName: weather.icon)
                .fontCurrentIcon()
        }
    }
}
