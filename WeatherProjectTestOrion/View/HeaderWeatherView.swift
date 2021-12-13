//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var body: some View {
        VStack(spacing: 16) {
            CityTitleView()
            CurrentWeatherView()
            DetailsForCurrentWeatherView()
        }
        .frame(width: 375, height: 320)
        .background(Image("cloudyBackground")
                        .resizable()
                        .scaledToFill())
        
    }
}

struct HeaderWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderWeatherView()
    }
}
