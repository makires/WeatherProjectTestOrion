//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct DailyWeatherListView: View {
    @Binding var startLeftTopPointY: CGFloat
    @Binding var leftTopPointY: CGFloat
    
    var body: some View {
        GeometryReader { geoProxyOutside in
            ScrollView {
                Color.yellow
                    .opacity(0.4)
                    .frame(height: 100)
.background(
    GeometryReader { geometryProxyBackground in
        Color.clear
            .preference(key: OffsetPreferenceKey.self, value: geometryProxyBackground.frame(in: .global).minY)
            .onAppear {
                startLeftTopPointY = geometryProxyBackground.frame(in: .global).minY
            }
    })
                    ForEach(listDaily, id:\.self) { item in
                        DailyWeatherRow(dailyWeather: item)
                        Divider()
                            .padding(0)
                    }
                    
                }
            .border(.red, width: 2)
//
//.frame(height: leftTopPointY < startLeftTopPointY ? geoProxyOutside.size.height + leftTopPointY : geoProxyOutside.size.height)
//.offset(y: leftTopPointY < startLeftTopPointY ? -110 : 0)
                        .offset(y: -191)
                        .frame(height: geoProxyOutside.size.height + 191)
.onPreferenceChange(OffsetPreferenceKey.self) { newLeftTopPintY in
     leftTopPointY = newLeftTopPintY
     print("Координата верхней ячейки Y changed, it is: \(newLeftTopPintY)")
                    }
                
        }
            

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


//struct DailyWeatherListView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DailyWeatherListView()
//            MainView()
//        }
//    }
//}
