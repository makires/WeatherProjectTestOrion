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
        ScrollView {
            ForEach(weatherVM.weatherDailyForecast.days, id: \.id) { day in
                DailyWeatherRow(dailyForecast: day)
                Divider()
                    .padding(0)
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: OffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin.y)
                }
            )

        }
        .offset(y: weatherVM.isScrolled ? -86 : 0)
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(OffsetPreferenceKey.self) { value in
            weatherVM.isScrolled = value < .zero ? true : false
        }
    }
}
