//
//  WeatherOnSheetBottom.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct WeatherOnSheetBottom: View {
    @ObservedObject var mapVM: MapViewModel
  
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(mapVM.nameCityForSheet + ", " + mapVM.weatherCurrentForSheet.country)
                    .fontTitleCitySheet()
                Text(mapVM.weatherCurrentForSheet.textWeatherCondition +
                     Localization.feelsLike.localized +
                     mapVM.weatherCurrentForSheet.feelsLikeTemperature)
                    .fontDesciprionConditionWeather()
                    .foregroundColor(.sheetDescriptionWeather)
            }
            Spacer()
            HStack {
                Image(systemName: mapVM.weatherCurrentForSheet.icon)
                    .foregroundColor(mapVM.weatherCurrentForSheet.icon == WeatherIcon.clearDay.rawValue ?
                                        .yellow : .iconWeatherCityRow)
                    .fontIconCurrentWeatherForSheetCity()
                Text(mapVM.weatherCurrentForSheet.temperatureCurrent)
                    .fontTemperatureCurrentForSheetCity()
            }
            .font(.largeTitle)
        }
    }
}
