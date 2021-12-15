//
//  Home.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
            ScrollView(.vertical) {
                ZStack {
                    GeometryReader { gr in
                        Image("cloudyBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: gr.size.width, height: gr.size.height*0.4)
                    }
                    .border(.purple, width: 2)
                        VStack {
//                            CityTitleView()
                            CurrentWeatherView(currentTemperature: "+16°", descriptionCurrentWeather: "Cloudy, Feels like +20°", currentWeatherIcon: "Cloudy")
                            DetailsForCurrentWeatherView()
                        }
                    
                }
               DailyWeatherListView()
            }
            .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
