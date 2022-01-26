//
//  MeteorologicalDataView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct MeteorologicalDataView: View {
    let weather: Weather
    var body: some View {
        HStack {
            VStack(spacing: MagicNumber.x4) {
                Image(systemName: Icon.iconWind)
                Image(systemName: Icon.iconSafari)
                Image(systemName: Icon.iconDrop)
            }
            VStack(alignment: .leading, spacing: MagicNumber.x4) {
                HStack(spacing: .zero) {
                    Text(weather.windKph)
                    Text(Localization.kmH.localized)
                    Text(LocalizedStringKey(weather.windDirection))
                        .foregroundColor(.measure)
                }
                HStack(spacing: .zero) {
                    Text(weather.pressureHPa)
                    Text(Localization.hPa.localized).foregroundColor(.measure)
                }
                HStack(spacing: .zero) {
                    Text(weather.humidity)
                    Text("%").foregroundColor(.measure)
                }
            }
        }
    }
}
