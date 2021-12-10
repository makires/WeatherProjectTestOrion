//
//  CurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
            //+16°
        HStack {
            VStack {
                Text("+16°")
                    .font(.system(size: 80, weight: .thin))
        //            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .tracking(0.37)
                //Cloudy, Feels like +20°
                Text("Cloudy, Feels like +20°")
                    .font(.system(size: 12, weight: .regular))
//                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            
        }
        .frame(width: 375, height: 112)
            
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentWeatherView()
                .previewLayout(.fixed(width: 375, height: 112))
            
        }
    }
}
