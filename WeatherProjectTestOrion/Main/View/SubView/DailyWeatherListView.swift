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
    var body: some View {
        GeometryReader { _ in
            ScrollView {
                Color.clear
                    .background(
                        GeometryReader { geometryProxyBackground in
                            Color.clear
                                .preference(key: OffsetPreferenceKey.self,
                                            value: geometryProxyBackground.frame(in: .global).minY)
                        })
                ForEach(weatherVM.weatherDailyForecast.days, id: \.id) { day in
                    DailyWeatherRow(dailyForecast: day)
                    Divider()
                        .padding(0)
                }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { newLeftTopPointY in
                weatherVM.leftTopPointScroll = newLeftTopPointY
            }
        }
    }
}
