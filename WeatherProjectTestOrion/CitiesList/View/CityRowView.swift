//
//  CityRowView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct CityRowView: View {
  var cityName: String
  var weather: Weather
  let gridItems = [
    GridItem()]
  @Binding var editListCities: Bool
  @EnvironmentObject var citiesVM: CitiesListViewModel
  @EnvironmentObject var weatherVM: WeatherViewModel
  var body: some View {
    VStack {
      if editListCities {
        HStack {
          cityAndRegionName
          Spacer()
          Button {
            citiesVM.remove(cityName: cityName)
          } label: {
            Image(systemName: Constants.Icon.iconButtonDelete)
              .foregroundColor(.red)
              .padding(EdgeInsets(top: .main, leading: .zero, bottom: .main, trailing: .x2))
          }
        }
      } else {
        HStack {
          cityAndRegionName
          Spacer()
          iconAndCurrentTemperature
        }
        .padding(.bottom, -.main)
        Divider()
          .padding(.horizontal, .main)
        descriptionWeather
      }
    }
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.borderCityRow))
    .padding(.horizontal, .x2)
    .padding(.vertical, .s2)
  }
  var cityAndRegionName: some View {
    VStack(alignment: .leading, spacing: 2) {
      HStack {
        Text(LocalizedStringKey(cityName))
        if LocalizedStringKey(cityName) == LocalizedStringKey(weatherVM.currentCity) {
          Image(Constants.Image.imageMapPin)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: .x2)
        }
      }
      HStack {
        Text(weather.region + ", " + weather.country)
      }
      .foregroundColor(.subText)
      .fontDesciprionConditionWeather()
    }
    .padding(EdgeInsets(top: .main, leading: .main, bottom: .main, trailing: .zero))
  }

  var iconAndCurrentTemperature: some View {
    LazyHGrid(rows: gridItems, spacing: 4) {

      Image(systemName: weather.icon)
        .font(.title)
        .foregroundColor(weather.icon == WeatherIcon.clearDay.rawValue ? .yellow : .iconWeatherCityRow)
        .frame(width: 44, height: 44)
      Text(weather.temperatureCurrent)
    }
    .frame(width: 120, alignment: .leading)
    .fontCurrentTemperatureRowListCities()
    .padding(.trailing, .s3)
  }
  var descriptionWeather: some View {
    HStack {
      HStack {
        Text(Localization.humidity.localized)
        Text(weather.humidity + "%" + " |")
        // MARK: - "в макете ветер с полным наименованием, с сервера всегда короткий")
        Text(LocalizedStringKey(weather.windDirection))
        Text("|")
        Text(weather.windKph) + Text(Localization.kmH.localized)
      }
      Spacer()
      HStack {
        Text(weather.minTemperatureCelcius + " / " + weather.maxTemperatureCelcius)
          .tracking(-0.32)
      }
      .fontDescriptionWeatherRowListCities()
    }
    .padding(.horizontal, .main)
    .padding(.bottom, .s6)
    .fontDesciprionConditionWeather()
    .foregroundColor(.subText)
  }
}
