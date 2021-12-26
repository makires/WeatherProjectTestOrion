//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

let celsius: LocalizedStringKey = "°"
let feelsLike: LocalizedStringKey = ", Feels like "
let hello: LocalizedStringKey = "hello"

struct CurrentWeatherView: View {
    @Environment(\.locale) var locale
    @ObservedObject var weatherVM: WeatherViewModel
    var weather: Weather
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
//                Text("\(weatherVM.leftTopPointScroll)")
                HStack {
                    Text(weather.temperatureCurrent)
                }
                .font(.system(size: 80, weight: .thin))
                // выравнивание по верху, так как weather.text может прийти
                // очень длинным и будет коряво отображаться
                //                  ⬇︎
                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        Text(weather.text)
                    }
                    VStack {
                        Text(feelsLike)
                    }
                    VStack {
                        Text(weather.feelsLikeTemperature)
                    }
                }
                .padding(0)
                .font(.system(size: 12, weight: .regular))
            }
            Spacer()
            AsyncImage(url: URL(string: weather.icon)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
           }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentWeatherView(weatherVM: WeatherViewModel(weatherService: WeatherService()), weather: Weather())
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
        }
    }
}
