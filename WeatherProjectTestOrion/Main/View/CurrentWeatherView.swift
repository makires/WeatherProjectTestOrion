//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    var weather: Weather
    var dataIcon: Data? = nil
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(weather.temperatureCurrent + "°")
                    .font(.system(size: 80, weight: .thin))
                Text("\(weather.text), Feels like \(weather.feelsLikeTemperature)°")
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
            CurrentWeatherView(weather: Weather())
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
            
        }
    }
}
