//
//  BlurView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.01.2022.
//

import Foundation
import SwiftUI

struct SheetBottomWeatherView: View {
    var coordinatesCityForNetwork: String
    @Binding var showSheet: Bool
    @ObservedObject var mapVM: MapViewModel
    @State var isShowMainView = false
  @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var weatherVM: WeatherViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel
    var buttonsCancelAdd: some View {
        HStack(spacing: MagicNumber.x8) {
            Spacer()
            Button(action: {
                showSheet = false
            }, label: {
                Text(Localization.cancel.localized)
            })
                .foregroundColor(.secondary)//
            Button(action: {
                guard let searchedCity = mapVM.annotationsMark.first?.name else { return }
                weatherVM.currentCity = searchedCity
                citiesVM.encodeCitiesToStorage(nameCity: searchedCity)
                isShowMainView.toggle()
            }, label: {
                Text(Localization.add.localized)
            })
        }
    }
    var weatherElements: some View {
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
    var body: some View {
        GeometryReader { _ in
            VStack {
                weatherElements
                    .padding(.horizontal, MagicNumber.x4)
                buttonsCancelAdd
                    .padding(.top, MagicNumber.x6)
                    .padding(.bottom, MagicNumber.x16)
                    .padding(.trailing, MagicNumber.x4)
            }
            .padding(.top, MagicNumber.x5)
            .background(colorScheme == .dark ? .black : .white)
        }
        .cornerRadius(MagicNumber.x2)
        .fullScreenCover(isPresented: $isShowMainView) {
            MainView()
        }
    }
}
