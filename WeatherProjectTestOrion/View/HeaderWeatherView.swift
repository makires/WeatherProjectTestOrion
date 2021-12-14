//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var body: some View {
        ZStack {
            Image("cloudyBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 16) {
                CityTitleView()
                CurrentWeatherView()
                DetailsForCurrentWeatherView()
                    .padding(.bottom, 5)
            }
        }
        //        .border(.red, width: 2)
        .frame(width: 375, height: 320)
        
//        .padding(.top, -20)
//        .padding(.bottom, -200)
    }
}

struct HeaderWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
            MainView()
            
        }
    }
}
