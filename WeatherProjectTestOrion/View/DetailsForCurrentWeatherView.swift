//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.green)
        }
        .frame(width: 498, height: 88)
        .padding(.bottom, 8)
        
    }
}

struct DetailsForCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsForCurrentWeatherView()
                .previewLayout(.fixed(width: 498, height: 88))
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
        }
    }
}
