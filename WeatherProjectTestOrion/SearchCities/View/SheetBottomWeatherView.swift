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
        guard let searchedCity = mapVM.annotationsMark.first?.name else { return }
        print("добавить город в список", searchedCity)
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
          .foregroundColor(Color.sheetDescriptionWeather)
      }
      Spacer()
      HStack {
        Image(systemName: mapVM.weatherCurrentForSheet.icon)
          .foregroundColor(mapVM.weatherCurrentForSheet.icon == WeatherIcon.clearDay.rawValue ?
                            .yellow : Color.iconWeatherCityRow)
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
  }
}
