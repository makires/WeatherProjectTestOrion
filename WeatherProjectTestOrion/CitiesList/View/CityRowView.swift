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
                        Image(systemName: Icon.iconButtonDelete)
                            .foregroundColor(.red)
                            .padding(EdgeInsets(top: MagicNumber.x2,
                                                leading: .zero,
                                                bottom: MagicNumber.x2,
                                                trailing: MagicNumber.x4))
                    }
                }
            } else {
                HStack {
                    cityAndRegionName
                    Spacer()
                    iconAndCurrentTemperature
                }
                .padding(.bottom, -MagicNumber.x2)
                Divider()
                .padding(.horizontal, MagicNumber.x2)
                descriptionWeather
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: MagicNumber.x1)
                .strokeBorder(Color.borderCityRow))
        .padding(.horizontal, MagicNumber.x4)
        .padding(.vertical, MagicNumber.x1)
    }
    var cityAndRegionName: some View {
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

    var iconAndCurrentTemperature: some View {
        LazyHGrid(rows: gridItems, spacing: MagicNumber.x1) {
            Image(systemName: weather.icon)
                .font(.title)
                .foregroundColor(weather.icon == WeatherIcon.clearDay.rawValue ? .yellow : .iconWeatherCityRow)
                .frame(width: 44, height: 44)
            Text(weather.temperatureCurrent)
        }
        .frame(width: 120, alignment: .leading)
        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, MagicNumber.x1)
    }
    var descriptionWeather: some View {
        HStack {
            HStack {
                Text(Localization.humidity.localized)
                Text(weather.humidity + "%" + " |")
                Text(LocalizedStringKey(weather.windDirection))
                Text("|")
                Text(weather.windKph) + Text(Localization.kmH.localized)
            }
            Spacer()
                Text(weather.minTemperatureCelcius + " / " + weather.maxTemperatureCelcius)
//                .minTemperatureText()
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, MagicNumber.x2)
        .padding(.bottom, MagicNumber.x3)
        .fontDesciprionConditionWeather()
        .foregroundColor(.secondary)
    }
}
