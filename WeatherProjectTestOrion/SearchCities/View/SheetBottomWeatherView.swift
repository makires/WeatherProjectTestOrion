//
//  BlurView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.01.2022.
//

import Foundation
import SwiftUI

struct SheetBottomWeatherView: View {
    @Binding var showSheet: Bool
    @ObservedObject var mapVM: MapViewModel
    var body: some View {
        GeometryReader { _ in
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(mapVM.weatherCurrentForSheet.cityName + ", " + mapVM.weatherCurrentForSheet.country)
                            .fontTitleCitySheet()
                        Text(mapVM.weatherCurrentForSheet.textWeatherCondition +
                             Localization.feelsLike.localized +
                             mapVM.weatherCurrentForSheet.feelsLikeTemperature)
                            .fontDesciprionConditionWeather()
                            .foregroundColor(Color.sheetDescriptionWeather)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: mapVM.weatherCurrentForSheet.icon)
                            .foregroundColor(Color.iconWeatherCityRow)
                            .fontIconCurrentWeatherForSheetCity()
                        Text(mapVM.weatherCurrentForSheet.temperatureCurrent)
                            .fontTemperatureCurrentForSheetCity()
                    }
                    .font(.largeTitle)
                }
                .padding(.horizontal, 16)
                HStack(spacing: 32) {
                    Spacer()
                    Button(action: {
                        showSheet = false
                    }, label: {
                        Text(Localization.cancel.localized)
                    })
                    .foregroundColor(Color.buttonSheetCancel)
                    Button(action: {
                        print("добавить город в список")
                    }, label: {
                        Text(Localization.add.localized)
                    })
                }
                .padding(.top, 26)
                .padding(.bottom, 68)
                .padding(.trailing, 16)
            }
            .padding(.top, 22)
            .background(.white)
        }
        .background(Color.yellow.opacity(0.5))
        .onAppear {
            print(" запросить текущую погоду для модуля")
        }
    }
}
