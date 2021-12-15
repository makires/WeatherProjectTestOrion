//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var backgroundHeaderWeatherView = "cloudyBackground"
    var cityTitle = "Nizhny Novgorod"
    var currentWeatherIcon = "Cloudy"
    var currentTemperature = "+16°"
    var descriptionCurrentWeather = "Cloudy, Feels like +20°"
    
    var body: some View {
        ZStack {
            Image(backgroundHeaderWeatherView)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                HStack {
                    Text(cityTitle)
                        .font(.largeTitle)
                        .tracking(0.37)
                    Spacer()
                    Button(action: {
                        print("")
                    }, label: {
                        Image(systemName: "list.bullet")
                            .font(.body)
                    })
                }
                .padding(.leading, 16)
                .padding(.trailing, 10)
                
                CurrentWeatherView(currentTemperature: currentTemperature,
                                   descriptionCurrentWeather: descriptionCurrentWeather,
                                   currentWeatherIcon: currentWeatherIcon)
                    .padding(.horizontal, 16)
                DetailsForCurrentWeatherView()
                    .font(.system(size: 12, weight: .regular))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                
            }
        }
        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .frame(height: 320)
        
        
        
        
    }
}

struct HeaderWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderWeatherView()
                .previewLayout(.sizeThatFits)
            MainView()
            
        }
    }
}
