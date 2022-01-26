//
//  CityAndRegionNames.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct CityAndRegionNames: View {
    var cityName: String
    var weather: Weather
    @EnvironmentObject var weatherVM: WeatherViewModel
  
    var body: some View {
        VStack(alignment: .leading, spacing: MagicNumber.x05) {
            HStack {
                Text(LocalizedStringKey(cityName))
                if LocalizedStringKey(cityName) == LocalizedStringKey(weatherVM.currentCity) {
                    Image(Images.imageMapPin)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: MagicNumber.x4)
                }
            }
            HStack {
                Text(weather.region + ", " + weather.country)
            }
            .foregroundColor(.secondary)
            .fontDesciprionConditionWeather()
        }
        .padding(EdgeInsets(top: MagicNumber.x2, leading: MagicNumber.x2, bottom: MagicNumber.x2, trailing: .zero))
    }
}
