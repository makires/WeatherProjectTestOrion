//
//  CityRowView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI
var minTemperature = "+16º"
var maxTemperature = "15º"

struct CityRowView: View {
    var cityName: String
    var weather: Weather
    @Binding var editList: Bool
    @Binding var citiesList: [String]
    @Environment(\.locale.identifier) var locale
    @AppStorage("cities") var citiesDataStorage: Data!
    @ObservedObject var cityVM = CityViewModel(weatherService: WeatherService())

    var body: some View {
        VStack {
            if editList {
                HStack {
                    VStack(spacing: 2) {
                        cityAndRegionName
                    }
                    Spacer()
                    Button {
                        print("deleted city")
                        if let firstIndex = citiesList.firstIndex(of: cityName) {
                            citiesList.remove(at: firstIndex)
                            let newCitiesDataStorage = CitiesListDataStorage(cities: citiesList).encode()
                            guard newCitiesDataStorage != nil else {
                                print("не удалось закодировать список городов в Data")
                                return
                            }
                            citiesDataStorage = newCitiesDataStorage
                        } else {
print("удалится первый совпадающий по названию город, если городов будет несколько одинаковых? - тест ")
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.red)
                            .rotationEffect(Angle(degrees: 45))
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
                Divider()
                descriptionWeather
            }
        }
        .onAppear(perform: {
            cityVM.getCurrentWeather(for: cityName, locale: locale)
        })
        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color("borderCityRow"))
                    )
        .padding(.horizontal, 16)
        .padding(.vertical, 4)

    }
    var cityAndRegionName: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cityName)
                Image("mappin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10.5, height: 15)
            }
            HStack {
//                Text(weather.region)
                Text("Субъект рф")
//                Text(weather.country)
                Text("Страна")
            }
            .foregroundColor(Color("subText"))
            .fontDesciprion()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
    }
    var iconAndCurrentTemperature: some View {
        HStack(spacing: 16) {
            Image(systemName: "cloud")
            Text(weather.temperatureCurrent)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 4.5, trailing: 0))
        }
        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, 8)
    }
    var descriptionWeather: some View {
        HStack {
            HStack {
                Text("Humidity")
                Text("83%")
                Text("|")
                Text("Southeast")
                Text("|")
                Text("10") + Text(" km/h")
            }
            Spacer()
            HStack {
                Text(minTemperature) + Text("/") + Text(maxTemperature)
            }
            .fontDescriptionWeatherRowListCities()
        }
        .padding(.horizontal, 8)
        .padding(.bottom, 11)
        .font(.system(size: 12, weight: .regular))
        .foregroundColor(Color("subText"))
    }
}

struct CityRowView_Previews: PreviewProvider {
    @State static var cities = [""]
    static var previews: some View {

            ScrollView {
                CityRowView(cityName: "Kemerovo",
                            weather: Weather(),
                            editList: .constant(false),
                            citiesList: $cities,
                            cityVM: CityViewModel(weatherService: WeatherService()))
                CityRowView(cityName: "Kemerovo",
                            weather: Weather(),
                            editList: .constant(false),
                            citiesList: $cities,
                            cityVM: CityViewModel(weatherService: WeatherService()))
            }
            .previewLayout(.sizeThatFits)

    }
}
