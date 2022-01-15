//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct DailyWeatherListView: View {
    @Binding var isScrolled: Bool
    @EnvironmentObject var weatherVM: WeatherViewModel
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    ForEach(weatherVM.weatherDailyForecast.days, id: \.id) { day in
                        DailyWeatherRow(dailyForecast: day)
                        Divider()
                    }
                }
                .background(.white)
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: OffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin.y)
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(OffsetPreferenceKey.self) { value in
            isScrolled = value < .zero ? true : false
        }
    }
}
struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
