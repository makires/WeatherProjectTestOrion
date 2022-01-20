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
    HStack(spacing: .x4) {
      Spacer()
      Button(action: {
        showSheet = false
      }, label: {
        Text(Localization.cancel.localized)
      })
        .foregroundColor(.buttonSheetCancel)
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
          .padding(.horizontal, .x2)
        buttonsCancelAdd
          .padding(.top, .x3)
          .padding(.bottom, .x8)
          .padding(.trailing, .x2)
      }
      .padding(.top, .s11)
      .background(.white)
    }
    .cornerRadius(.s5)
    .fullScreenCover(isPresented: $isShowMainView) {
      MainView()
    }
  }
}
