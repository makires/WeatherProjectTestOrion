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
            .frame(height: 92)
            .border(.black, width: 2)
            .padding(.leading, 16)
            .padding(.top, 12)
            .padding(.bottom, 8)
            
            Spacer()
            VStack {
                Image("Cloudy")
            }
            .frame(width: 80, height: 80)
            .padding(.trailing, 16)
        }
        .frame(width: 375, height: 112)
        .border(.yellow, width: 2)
        
    }
}


struct CurrentTempView: View {
    var body: some View {
            Text("+16°")
                .font(.system(size: 80, weight: .thin))
                .tracking(0.37)
                .frame(width: 154, height: 72)
                .border(.green, width: 2)
//                .padding(.top, 12)
//                .padding(.leading, 16)
        
    }
}

struct DescriptionCurrentWeatherView: View {
    var body: some View {
            Text("Cloudy, Feels like +20°")
                .font(.system(size: 12, weight: .regular))
                .frame(width: 130, height: 16)
//                .padding(.leading, 16)
//                .padding(.bottom, 8)
                .border(.green, width: 2)
            
        

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
