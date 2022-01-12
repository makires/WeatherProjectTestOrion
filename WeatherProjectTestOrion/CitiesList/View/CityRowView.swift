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
        GridItem(.fixed(70), alignment: .trailing),
        GridItem(alignment: .trailing)]
    @Binding var editListCities: Bool
    @ObservedObject var citiesVM: CitiesListViewModel
    // MARK: - запрос текущего города по геопозиции
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService())
    var body: some View {
        VStack {
            if editListCities {
                HStack {
                    cityAndRegionName
                    Spacer()
                    Button {
                        citiesVM.remove(cityName: cityName)
                    } label: {
                        Image(systemName: iconButtonDelete)
                            .foregroundColor(.red)

                            .rotationEffect(Angle(degrees: rotationEffectForButtonDeleteCity))
                            .frame(width: 44, height: 44)
                            .padding(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 8))
                    }
                }
            } else {
                HStack {
                    cityAndRegionName
                    Spacer()
                    iconAndCurrentTemperature
                }
                .padding(.bottom, -8)
                Divider()
                    .padding(.horizontal, 8)
                descriptionWeather
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadiusCityRowOverlay)
                .strokeBorder(Color.borderCityRow))
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
    var cityAndRegionName: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(LocalizedStringKey(cityName))
                if cityName == weatherVM.cityTitleStatic {
                    Image(imageMapPin)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: heightMappin)
                }
            }
            HStack {
                Text(weather.region + ", " + weather.country)
            }
            .foregroundColor(Color.subText)
            .fontDesciprionConditionWeather()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
    }

    var iconAndCurrentTemperature: some View {
        LazyVGrid(columns: gridItems, alignment: .leading) {
            Image(systemName: weather.icon)
                .font(.title)
                .foregroundColor(Color.iconWeatherCityRow)
                .frame(width: 44, height: 44)
            Text(weather.temperatureCurrent)
        }

        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, 8)
    }
    var descriptionWeather: some View {
        HStack {
            HStack {
                Text(Localization.humidity.localized)
                Text(weather.humidity + symbolPercentage + " |")
                // MARK: - "в макете ветер с полным наименованием, с сервера всегда короткий")
                Text(LocalizedStringKey(weather.windDirection))
                Text("|")
                Text(weather.windKph) + Text(Localization.kmH.localized)
            }
            Spacer()
            HStack {
                Text(weather.minTemperatureCelcius + "/" + weather.maxTemperatureCelcius)
                    .tracking(-0.32)
            }
            .fontDescriptionWeatherRowListCities()
        }
        .padding(.horizontal, 8)
        .padding(.bottom, 11)
        .fontDesciprionConditionWeather()
        .foregroundColor(Color.subText)
    }
}
