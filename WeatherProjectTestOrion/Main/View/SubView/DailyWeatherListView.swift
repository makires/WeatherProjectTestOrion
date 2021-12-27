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
                    .opacity(0)
//                    .frame(width: 0, height: 10)
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
//                ForEach(listDaily, id: \.self) { _ in
//                    Text("sdsd")
//                    Divider()
//                }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { newLeftTopPointY in
                weatherVM.leftTopPointScroll = newLeftTopPointY
            }
        }
//        .border(.red, width: 2)
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
                    Image(systemName: dailyForecast.day.condition.iconName)
//                        .symbolRenderingMode(.multicolor)
                        .foregroundStyle(.blue, .yellow, .blue)
//                        .renderingMode(.original)
                    Text(dailyForecast.day.maxTemperatureCelcius.temperatureConverter)
                        .tracking(0.35)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .font(.system(size: 22, weight: .regular))
                    Text(dailyForecast.day.minTemperatureCelcius.temperatureConverter)
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
            DailyWeatherListView(weatherVM: WeatherViewModel(weatherService: WeatherService()))
            MainView()
        }
    }
 }
