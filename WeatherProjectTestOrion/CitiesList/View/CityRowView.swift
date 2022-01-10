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
//    @State var cityName: String = ""
    var cityName: String
    var weather: Weather
    let gridItems = [ GridItem(.fixed(50), spacing: 14), GridItem(.fixed(80))]
    @Binding var editList: Bool
    @ObservedObject var citiesVM: CitiesListViewModel
    var body: some View {
        VStack {
            if editList {
                HStack {
                    VStack(spacing: 2) {
                        cityAndRegionName
                    }
                    Spacer()
                    Button {
                        citiesVM.remove(cityName: cityName)
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
        
        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color("borderCityRow"))
                    )
        .padding(.horizontal, 16)
        .padding(.vertical, 4)

    }
    var cityAndRegionName: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(LocalizedStringKey(cityName))
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
        HStack {
            LazyVGrid(columns: gridItems, alignment: .trailing) {
                Image(systemName: "cloud")
                Text(weather.temperatureCurrent)
//                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 4.5, trailing: 0))

            }
        }
        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, 8)
    }
    var descriptionWeather: some View {
        HStack {
            HStack {
                Text(Localization.humidity.localized)
                Text(weather.humidity)
                Text("|")
                #warning("в макете ветер с полным наименованием, с сервера всегда короткий")
                Text(LocalizedStringKey(weather.windDirection))
                Text("|")
                Text(weather.windKph) + Text(Localization.kmH.localized)
            }
            Spacer()
            HStack {
                #warning("макс и мин температуру запрашивать через другую модель")
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

//struct CityRowView_Previews: PreviewProvider {
//    @State static var cities = [""]
//    static var previews: some View {
//
//            ScrollView {
//                CityRowView(cityName: "Kemerovo",
//                            editList: .constant(false), citiesVM: CitiesListViewModel(weatherService: WeatherService()))
//                CityRowView(cityName: "Kemerovo",
//                            editList: .constant(false), citiesVM: CitiesListViewModel(weatherService: WeatherService()))
//            }
//            .previewLayout(.sizeThatFits)
//
//    }
//}
