//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct FrameOriginYPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct DailyWeatherListView: View {
    
    var body: some View {
        List {
            ForEach(listDaily, id:\.self) { item in
                DailyWeatherRow(dailyWeather: item)
            }
            .listRowInsets(EdgeInsets())
            .background(
                GeometryReader { geometryProxy in
                    Color.clear
                        .preference(key: FrameOriginYPreferenceKey.self, value: geometryProxy.frame(in: .global).origin.y)
                })
        }
        .listStyle(.plain)
        
        .onPreferenceChange(FrameOriginYPreferenceKey.self) { newSize in
            print("The new child frame Y is: \(newSize)")
        }
        // как List разместить в ScrollView
        ////        GeometryReader { g in
        //        ScrollView {
        ////            List {
        //                    ForEach(listDaily, id:\.self) { item in
        //                        DailyWeatherRow(dailyWeather: item)
        //                        Divider()
        ////                    }
        ////                    .listRowInsets(EdgeInsets())
        //
        //                    // попробовать через жест?
        //            }        .listStyle(.plain)
        ////                .frame(width: g.size.width-0, height: g.size.height-0)
        //        }
        ////    }
        //
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
