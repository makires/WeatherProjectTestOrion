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
                    VStack(spacing: 13.5) {
                        Text("Now")
                        // получать доступ к часу через vm? но уже есть отдельная model  специально для погоды 🤔хм
                        // если облако со снегом или дождем то картинка увеличивается и отображение съезжает
                        // подумать что исправить
                        Image(systemName: hourlyCurrentWeather.hours.first?.condition.iconName ?? "")
                        Text(hourlyCurrentWeather.hours.first?.temperatureCelcius.temperatureConverter ?? "")
                        // когда наступает 23 -00 отображать нечего,
                        // массив пустой и первый элемент оказывается nil, что надо делать с этим?
                    }
                ForEach(hourlyCurrentWeather.hours.dropFirst(), id: \.id) { hourItem in
                    VStack(spacing: 13.5) {
                        Text("\(hourItem.timeEpoch.formattedHour)")
                        Image(systemName: hourItem.condition.iconName)
                        Text(hourItem.temperatureCelcius.temperatureConverter)
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
                    Text(LocalizedStringKey(weather.windDirection))
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
