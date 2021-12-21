//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
    var weather: Weather
    
    var body: some View {
        HStack(spacing: 33) {
            MeteorologicalDataView(weather: weather)
            HourlyCurrentWeatherView()
        }
        
    }
}

struct HourlyCurrentWeatherView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hourlyCurrentWeather, id: \.self) { item in
                    VStack(spacing: 13.5) {
                        Text(item.hour)
                        Image(systemName: item.icon)
                        Text(item.temp)
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
                Text("\(weather.windKph)") + Text(" km/h, \(weather.windDirection)").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                Text("\(weather.pressureHPa)") + Text(" hPa").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                Text("\(weather.humidity)") + Text("%").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
            }
        }
    }
}

struct DetailsForCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsForCurrentWeatherView(weather: Weather())
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
                .previewLayout(.sizeThatFits)
        }
    }
}

