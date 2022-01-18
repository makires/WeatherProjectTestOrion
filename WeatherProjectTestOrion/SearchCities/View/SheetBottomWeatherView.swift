//
//  BlurView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.01.2022.
//

import Foundation
import SwiftUI

struct SheetBottomWeatherView: View {
    var cityName: String
    @Binding var showSheet: Bool
    @ObservedObject var mapVM: MapViewModel
    @State var isShowMainView = false
    @EnvironmentObject var weatherVM: WeatherViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale) var locale
    var buttonsCancelAdd: some View {
        HStack(spacing: 32) {
            Spacer()
            Button(action: {
                showSheet = false
            }, label: {
                Text(Localization.cancel.localized)
            })
                .foregroundColor(Color.buttonSheetCancel)
            Button(action: {
                guard let searchedCity = mapVM.annotationsMark.first?.name else {
                    print("не удалось извлечь город с карты")
                    return }
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
                Text(weatherVM.weatherCurrent.cityName + ", " + weatherVM.weatherCurrent.country)
                    .fontTitleCitySheet()
                Text(weatherVM.weatherCurrent.textWeatherCondition +
                     Localization.feelsLike.localized +
                     weatherVM.weatherCurrent.feelsLikeTemperature)
                    .fontDesciprionConditionWeather()
                    .foregroundColor(Color.sheetDescriptionWeather)
            }
            Spacer()
            HStack {
                Image(systemName: weatherVM.weatherCurrent.icon)
                    .foregroundColor(weatherVM.weatherCurrent.icon == WeatherIcon.clearDay.rawValue ?
                                        .yellow : Color.iconWeatherCityRow)
                    .fontIconCurrentWeatherForSheetCity()
                Text(weatherVM.weatherCurrent.temperatureCurrent)
                    .fontTemperatureCurrentForSheetCity()
            }
            .font(.largeTitle)
        }
    }
    var body: some View {
        GeometryReader { _ in
            VStack {
                weatherElements
                    .padding(.horizontal, 16)
                buttonsCancelAdd
                    .padding(.top, 26)
                    .padding(.bottom, 68)
                    .padding(.trailing, 16)
            }
            .padding(.top, 22)
            .background(.white)
        }
        .background(Color.yellow.opacity(0.5))
        .fullScreenCover(isPresented: $isShowMainView) {
            MainView()
        }
        .onAppear {
            Task {
                await weatherVM.getCurrentWeather(for: cityName, locale: locale.identifier)
            }
        }
    }
}
