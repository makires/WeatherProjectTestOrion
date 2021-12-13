//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
    var body: some View {
        HStack(spacing: 33) {
            DescriptionWithIconView()
            HourlyCurrentWeatherView()
        }
        
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

struct HourlyCurrentWeatherView: View {
    var body: some View {
            ScrollView(.horizontal) {
                    HStack {
                        ForEach(hourlyCurrentWeather, id: \.self) { item in
                            VStack {
                                VStack {
                                    Text(item.hour)
                                    .font(.system(size: 12, weight: .regular))
                                }
                                VStack {
                                    Image(systemName: item.icon)
                                        
                                        .frame(width: 24, height: 24)
                                }
                                VStack {
                                    Text(item.temp)
                                    .font(.system(size: 12, weight: .regular))
                                }
                                
                                    
                            }
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        }
                    }
                    
                    
                }

    }
}




struct DescriptionWithIconView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                HStack(spacing: 9.5) {
                        Image(systemName: "wind")
                            .padding(.leading, 18.25)
                            .padding(.top, 8.5)
                            .padding(.bottom, 13)
                        Text("10 km/h, SE")
                            .padding(.top, 8)
                            .padding(.bottom, 12)
                }
            }
            VStack {
                HStack(spacing: 9.5) {
                        Image(systemName: "safari")
                            .padding(.leading, 17.5)
                            .padding(.bottom, 14.33)
                        Text("983 hPa")
                        .padding(.bottom, 12)
                }
            }
            
            VStack {
                HStack(spacing: 12.5) {
                        Image(systemName: "drop")
                            .padding(.leading, 20.25)
                            .padding(.bottom, 9.83)
                        Text("83%")
                            .padding(.bottom, 8)
                    }
                
            }
        }
        .padding(.top, 0)
        .font(.system(size: 12, weight: .regular))
        
    }
}
