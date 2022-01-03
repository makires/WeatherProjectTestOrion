//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var backgroundHeaderWeatherView = "cloudyBackground"
    @ObservedObject var weatherVM: WeatherViewModel
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image(backgroundHeaderWeatherView)
                    .resizable()
                    .frame(height: 365)
                    .ignoresSafeArea()
                VStack {
                    // cityTitle
                    HStack {
                        Text(LocalizedStringKey(weatherVM.weatherCurrent.cityName))
                            .font(.largeTitle)
                            .tracking(0.37)
                        Spacer()
                        NavigationLink(destination: ListLocationsView( weather: weatherVM.weatherCurrent)) {
                            Image(systemName: "list.bullet")
                        }
                    }
                    .padding(.horizontal, 16)
                    CurrentWeatherView(weatherVM: weatherVM, weather: weatherVM.weatherCurrent)
                        .padding(.horizontal, 16)
                    DetailsForCurrentWeatherView(weather: weatherVM.weatherCurrent,
                                                 hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
                        .fontDesciprion()
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 30, trailing: 0))
                        .opacity(weatherVM.leftTopPointScroll > 324 ? 1 : 0)
                        .background( weatherVM.leftTopPointScroll > 324 ? Color.clear : Color.white
                        )

                }
            } // end ZStack
            .background(
                GeometryReader { gpZStackOutside in
                    Color.clear
                        .preference(key: SizeHeaderPreferenceKey.self, value: gpZStackOutside.size.height)
                }

            )
    }
                .frame(height: weatherVM.leftTopPointScroll > 320 ? 320 : 220)
                .animation(.easeOut(duration: 0.3))
            .foregroundColor(Color("mainTextWhite"))
            .onPreferenceChange(SizeHeaderPreferenceKey.self) { newValue in
                print("в ZStack (Header CurrentView) изменилось значение высоты = ", newValue)
            }
    }
}

struct SizeHeaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
