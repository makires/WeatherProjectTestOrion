//
//  CurrentWeatherViewTP.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 12.12.2021.
//

import SwiftUI

struct CurrentWeatherViewTP: View {
    var body: some View {
        ZStack {
            Text("+16°")
            .fontWeight(.ultraLight)
            .font(.largeTitle)
            .lineSpacing(72)
            .offset(x: -94.50, y: -8)

            Text("Cloudy, Feels like +20°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -106.50, y: 40)

            ZStack {
            }
            .frame(width: 80, height: 52)
            .padding(.top, 13)
            .padding(.bottom, 15)
            .offset(x: 131.50, y: 0)
            .frame(width: 80, height: 80)
            .frame(width: 375, height: 112)
        }
    }
}

struct CurrentWeatherViewTP_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherViewTP()
    }
}
