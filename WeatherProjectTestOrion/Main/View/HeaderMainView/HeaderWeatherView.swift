//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var cityTitle = "Nizhny Novgorod"
    var currentWeatherIcon = "Cloudy"
    var currentTemperature = "+16°"
    var descriptionCurrentWeather = "Cloudy, Feels like +20°"
    
    var body: some View {
        ZStack {
            Image("cloudyBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                HStack {
                    Text(cityTitle)
                        .font(.largeTitle)
                        .lineSpacing(41)
                    Spacer()
                    Button(action: {
                        print("")
                    }, label: {
                        Image(systemName: "list.bullet")
                            .font(.body)
                    })
                }
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .padding(EdgeInsets(top: 39, leading: 16, bottom: 0, trailing: 10))
                
                CurrentWeatherView(currentTemperature: currentTemperature, descriptionCurrentWeather: descriptionCurrentWeather, currentWeatherIcon: currentWeatherIcon)
                    .padding(.horizontal, 16)
                DetailsForCurrentWeatherView()
                    .border(.red, width: 2)
                
            }
        }
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
