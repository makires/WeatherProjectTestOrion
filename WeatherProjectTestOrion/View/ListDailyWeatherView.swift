//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI



struct ListDailyWeatherView: View {
    var body: some View {
        List(listDaily, id:\.self) { item in
            RowForListDailyWeather(dailyWeather: item)
                .listRowInsets(EdgeInsets())
                .border(.black, width: 2)
        }

        .listStyle(.plain)
    }
}



struct RowForListDailyWeather: View {
    let dailyWeather: DayWeather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dailyWeather.date)
                    .border(.red, width: 2)
                    .padding(.leading, 16)
                    .padding(.top, 12)
                Text(dailyWeather.nameDay)
                    .border(.red, width: 2)
                    .padding(.leading, 16)
                    .padding(.bottom, 12)
            }
            .border(.red, width: 2)
            
            
            Spacer()
            HStack(spacing: 10) {
                VStack {
                    Image(systemName: dailyWeather.icon)
                        .border(.red, width: 2)
                        .foregroundColor(dailyWeather.colorIcon)
                        .frame(width: 44, height: 44)
                }
                .border(.red, width: 2)
                .padding(.top, 10)
                .padding(.bottom, 10)
                HStack {
                    VStack {
                        Text(dailyWeather.temp1)
                            .font(.system(size: 22, weight: .regular))
                            .tracking(0.35)
                            
                            .border(.red, width: 2)
                            
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 0))
                    .frame(width: 52, height: 44)
                    .border(.green, width: 2)
                    VStack {
                        Text(dailyWeather.temp2)
                            .tracking(-0.32)
                            .border(.red, width: 2)
                        
                        .font(.system(size: 16, weight: .regular))
                    }
//                    .padding(.leading, 0)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    .padding(.trailing, 0)
                    
                }
            }
//            .padding(.trailing, 16)
        }
        
        let gridItems = [GridItem(),GridItem(),GridItem(),GridItem()]
    }
}

struct ListDailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ListDailyWeatherView()
    }
}
