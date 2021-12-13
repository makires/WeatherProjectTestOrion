//
//  HeaderWeatherViewTP.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 12.12.2021.
//

import SwiftUI

struct HeaderWeatherViewTP: View {
    var body: some View {
        VStack {
            CityTitleViewTP()
            CurrentWeatherViewTP()
            DetailsForCurrentWeatherViewTP()
        }
    }
}

struct HeaderWeatherViewTP_Previews: PreviewProvider {
    static var previews: some View {
        HeaderWeatherViewTP()
    }
}
