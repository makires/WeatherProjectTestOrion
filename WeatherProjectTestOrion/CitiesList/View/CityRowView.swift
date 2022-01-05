//
//  CityRowView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI
var minTemperature = "+16º"
var maxTemperature = "15º"
class CityRowViewModel: ObservableObject {
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    @Published var weatherCurrent = Weather()
    func getCurrentWeather(for city: String, locale: String) {
        weatherService.fetchCurrentWeather(for: city, locale: locale) { apiWeatherModel in
            self.weatherCurrent = Weather(response: apiWeatherModel)
        }
    }
}
struct CityRowView: View {
//    @State var cityName: String = ""
    var cityName: String
    @Binding var editList: Bool
    @ObservedObject var citiesVM: CitiesListViewModel
    @ObservedObject var cityRowVM = CityRowViewModel(weatherService: WeatherService())
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
        .onAppear(perform: {
            #warning("viewModel должна быть одна, а у тебя отдельная для ячейки")
            print("появилась ячейка \(cityName)")
            cityRowVM.getCurrentWeather(for: cityName, locale: "en")
            
        })
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
        HStack(spacing: 16) {
            Image(systemName: "cloud")
            Text("\(cityRowVM.weatherCurrent.temperatureCurrent)")
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 4.5, trailing: 0))
        }
        .fontCurrentTemperatureRowListCities()
        .padding(.trailing, 8)
    }
    var descriptionWeather: some View {
        HStack {
            HStack {
                Text(Localization.humidity.localized)
                Text("83%")
                Text("|")
                Text("Southeast")
                Text("|")
                Text("10") + Text(Localization.kmH.localized)
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
