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
    @Binding var editListCities: Bool
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel

    var body: some View {
        VStack {
            if editListCities {
                HStack {
                    CityAndRegionNames(cityName: cityName, weather: weather)
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
                    CityAndRegionNames(cityName: cityName, weather: weather)
                    Spacer()
                    IconAndCurrentTemperature(weather: weather)
                }
                .padding(.bottom, -MagicNumber.x2)
                Divider()
                    .padding(.horizontal, MagicNumber.x2)
                DescriptionWeather(weather: weather)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: MagicNumber.x1)
                .strokeBorder(Color.borderCityRow))
        .padding(.horizontal, MagicNumber.x4)
        .padding(.vertical, MagicNumber.x1)
    }
}
