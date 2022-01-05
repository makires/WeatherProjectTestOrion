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
                HStack {
                    Text(weather.temperatureCurrent)
                }
                .fontTitleCity()
                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        Text(weather.textWeatherCondition)
                    }
                    VStack {
                        Text(Localization.feelsLike.localized)
                    }
                    VStack {
                        Text(weather.feelsLikeTemperature)
                    }
                }
                .padding(0)
                .fontDesciprion()
            }
            Spacer()
            AsyncImage(url: URL(string: weather.icon)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
           }
    }
}
