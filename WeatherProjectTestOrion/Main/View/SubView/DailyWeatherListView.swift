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
    @ObservedObject var weatherVM: WeatherViewModel
    @Binding var startLeftTopPointY: CGFloat
    @Binding var leftTopPointY: CGFloat
    @Binding var heightDetailsCurrentWeatherView: CGFloat
    var body: some View {
        GeometryReader { _ in
            ScrollView {
                Color.clear
                // ?????????
//                    .frame(height: 0)
.background(
    GeometryReader { geometryProxyBackground in
        Color.clear
            .preference(key: OffsetPreferenceKey.self, value: geometryProxyBackground.frame(in: .global).minY)
            .onAppear {
                startLeftTopPointY = geometryProxyBackground.frame(in: .global).minY
            }
    })
                ForEach(weatherVM.weatherDailyForecast.days, id: \.id) { day in
                        DailyWeatherRow(dailyForecast: day)
                        Divider()
                            .padding(0)
                    }
                }
//                        .offset(y: -178)
//                        .offset(y: 0)
//                        .frame(height: geoProxyOutside.size.height + 191)
.onPreferenceChange(OffsetPreferenceKey.self) { newLeftTopPintY in
     leftTopPointY = newLeftTopPintY
     print("Координата верхней ячейки Y changed, it is: \(newLeftTopPintY)")
                    }
        }
    }
}

struct DailyWeatherRow: View {
    let dailyForecast: Forecastday
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dailyForecast.dateEpoch.formattedDay)
                    .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                Text(dailyForecast.dateEpoch.formattedNameDay)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            }
            Spacer()
            let gridItems = [GridItem(spacing: 10), GridItem( spacing: 4), GridItem(alignment: .trailing)]
            HStack {
                LazyVGrid(columns: gridItems) {
                    AsyncImage(url: URL(string: "https:" + dailyForecast.day.condition.icon)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 44, height: 44)
                    Text("\(dailyForecast.day.maxTemperatureCelcius, specifier: "%.0f")")
                        .tracking(0.35)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .font(.system(size: 22, weight: .regular))
                    Text("\(dailyForecast.day.minTemperatureCelcius, specifier: "%.0f")")
                        .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}
// struct DailyWeatherListView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DailyWeatherListView()
//            MainView()
//        }
//    }
// }
