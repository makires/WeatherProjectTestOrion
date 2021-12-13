//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                CurrentTempView()
                DescriptionCurrentWeatherView()
            }
            Spacer()
            VStack {
                Image("cloudy")
            }
            .frame(width: 80, height: 80)
            .padding(.trailing, 16)
        }
        .frame(width: 375, height: 112)
        
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentWeatherView()
                .previewLayout(.fixed(width: 375, height: 112))
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
            
        }
    }
}

struct CurrentTempView: View {
    var body: some View {
            Text("+16°")
                .font(.system(size: 80, weight: .thin))
                .tracking(0.37)
                .padding(.leading, 16)
                .padding(.top, 12)
                .padding(.bottom, 0)
        
    }
}

struct DescriptionCurrentWeatherView: View {
    var body: some View {
            Text("Cloudy, Feels like +20°")
                .font(.system(size: 12, weight: .regular))
                .padding(.leading, 16)
                .padding(.bottom, 8)
            
        

    }
}
