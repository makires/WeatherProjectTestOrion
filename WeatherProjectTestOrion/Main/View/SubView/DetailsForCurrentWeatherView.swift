//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
    var weather: Weather
    var hourlyCurrentWeather: HourlyCurrentWeather
    var body: some View {
        HStack(spacing: 33) {
            MeteorologicalDataView(weather: weather)
            HourlyCurrentWeatherView(hourlyCurrentWeather: hourlyCurrentWeather)
        }
    }
}

struct HourlyCurrentWeatherView: View {
    var hourlyCurrentWeather: HourlyCurrentWeather
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // создать отдельный элемент для первого часа с названием Now + Localization
                // применить функцию dropFirt() для ForEach
                
                    VStack(spacing: 13.5) {
                        Text("Now")
                        AsyncImage(url: URL(string: "https:" + (hourlyCurrentWeather.hours.first?.condition.icon ?? "") )) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 24, height: 24)
                        Text("\(hourlyCurrentWeather.hours.first?.temperatureCelcius ?? 0, specifier: "%.0f")")
                    }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack(spacing: 13.5) {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        AsyncImage(url: URL(string: "https:" + hourItem.condition.icon)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 24, height: 24)
                        Text("\(hourItem.temperatureCelcius, specifier: "%.0f")")
                    }
                }
            }
        }
    }
}

struct MeteorologicalDataView: View {
    let weather: Weather
    var body: some View {
        HStack {
            VStack(spacing: 12) {
                Image(systemName: "wind")
                Image(systemName: "safari")
                Image(systemName: "drop")
            }
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 0) {
                    Text(weather.windKph)
                    Text(" km/h ")
                    Text(weather.windDirection)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
                HStack(spacing: 0) {
                    Text(weather.pressureHPa)
                    Text(" hPa").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
                HStack(spacing: 0) {
                    Text(weather.humidity)
                    Text("%").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
            }
        }
    }
}

struct DetailsForCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsForCurrentWeatherView(weather: Weather(), hourlyCurrentWeather: HourlyCurrentWeather())
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
                .previewLayout(.sizeThatFits)
        }
    }
}
