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
  @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    ForEach(weatherVM.weatherDailyForecast.days, id: \.id) { day in
                        DailyWeatherRow(dailyForecast: day)
                        Divider()
                        .foregroundColor(.primary)
                    }
                }
                .background(colorScheme == .dark ? .black : .white)
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: OffsetPreferenceKey.self, value: geometry.frame(in: .named("SCROLL")).origin.y)
                }
            }
        }
        .coordinateSpace(name: "SCROLL")
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
