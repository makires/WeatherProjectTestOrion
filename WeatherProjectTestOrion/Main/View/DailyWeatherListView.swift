//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI



struct DailyWeatherListView: View {
    var body: some View {
            List {
                ForEach(listDaily, id:\.self) { item in
                    DailyWeatherRow(dailyWeather: item)
                        .listRowInsets(EdgeInsets())
                }
            }
          
//                    .offset(y: -110)
            .listStyle(.plain)
    }
}

struct DailyWeatherRow: View {
    let dailyWeather: DayWeather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dailyWeather.date)
                    .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                Text(dailyWeather.nameDay)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            }
            Spacer()
           
            let gridItems = [GridItem(spacing: 10), GridItem( spacing: 4), GridItem(alignment: .trailing)]
                
            HStack {
                LazyVGrid(columns: gridItems) {
                        Image(systemName: dailyWeather.icon)
                            .foregroundColor(dailyWeather.colorIcon)
                        Text(dailyWeather.temp1)
                            .tracking(0.35)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .font(.system(size: 22, weight: .regular))
                        Text(dailyWeather.temp2)
                            .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                    }
            }   
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}


struct DailyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailyWeatherListView()
            MainView()
        }
    }
}
