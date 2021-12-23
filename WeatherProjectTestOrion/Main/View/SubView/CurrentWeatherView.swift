//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

let celsius: LocalizedStringKey = "°"
let feelsLike: LocalizedStringKey = ", Feels like"
let hello: LocalizedStringKey = "hello"

struct CurrentWeatherView: View {
    var weather: Weather
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(hello)
                HStack {
                    Text(weather.temperatureCurrent)
                    Text(celsius)
                }
                .font(.system(size: 80, weight: .thin))
                HStack(spacing: 0) {
                    Text(weather.text)
                    Text(feelsLike)
                    Text(weather.feelsLikeTemperature)
                    Text(celsius)
                }
                .padding(0)
                .font(.system(size: 12, weight: .regular))
            }
            Spacer()
            // !! Enum
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
            CurrentWeatherView(weather: Weather())
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
        }
        //        .environment(\.locale, .init(identifier: "ru"))
    }
}
