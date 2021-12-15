//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    var currentTemperature: String
    var descriptionCurrentWeather: String
    var currentWeatherIcon: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(currentTemperature)
                    .font(.system(size: 80, weight: .thin))
                Text(descriptionCurrentWeather)
                    .font(.system(size: 12, weight: .regular))
            }
            Spacer()
            Image(currentWeatherIcon)
        }
    }
}




struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentWeatherView(currentTemperature: "+16°", descriptionCurrentWeather: "Cloudy, Feels like +20°", currentWeatherIcon: "Cloudy")
                .previewLayout(.sizeThatFits)
                .background(Color.gray)
            MainView()
            
        }
    }
}
