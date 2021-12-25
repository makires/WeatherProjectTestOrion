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
//                    .aspectRatio(contentMode: .fill)
                // разрешения картинки не хватает для высоты
                // внизу белая полоска и вверху сдвиг по safe area
                // подумать как?
                    .frame(height: 365)
//                    .scaledToFill()
                    .ignoresSafeArea()
//                    .ignoresSafeArea(edges: .top)
                VStack {
                    // cityTitle
                    HStack {
                        Text(LocalizedStringKey(weatherVM.weatherCurrent.cityName))
                            .font(.largeTitle)
                            .tracking(0.37)
                        Spacer()
                        Button(action: {
                            print("")
                        }, label: {
                            Image(systemName: "list.bullet")
                                .font(.body)
                        })
                    }
                    .padding(.horizontal, 16)
                    CurrentWeatherView(weatherVM: weatherVM, weather: weatherVM.weatherCurrent)
                        .padding(.horizontal, 16)
                    DetailsForCurrentWeatherView(weather: weatherVM.weatherCurrent,
                                                 hourlyCurrentWeather: weatherVM.weatherHourlyCurrent)
                        .font(.system(size: 12, weight: .regular))
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 30, trailing: 0))
                    // итоговый вариант
                    // необходимо изменить прозрачность до 0
//                        .opacity(0)
                        .opacity(weatherVM.leftTopPointScroll > 324 ? 1 : 0)
                    // AND
                    // необходимо добавлять при изменении фрэйма
                        .background( weatherVM.leftTopPointScroll > 324 ? Color.clear : Color.white
                           // по умолчанию он белый
//                            Color.clear
//                            Color.white
                        )
                    // конец / итоговый вариант

                }
            } // end ZStack
            .background(
                GeometryReader { gpZStackOutside in
                    Color.clear
                        .preference(key: SizeHeaderPreferenceKey.self, value: gpZStackOutside.size.height)
                }

            )
    } // end GeoReader
        // итоговый вариант
        // необходимо поменять высоту с 320 до 210
//                .frame(height: 210)
//                .frame(height: 324)
                .frame(height: weatherVM.leftTopPointScroll > 324 ? 324 : 210)
                .border(.red, width: 2)
//                .offset(y: 0)
        // конец / итоговый вариант
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .onPreferenceChange(SizeHeaderPreferenceKey.self) { newValue in
                print("в ZStack (Header CurrentView) изменилось значение высоты = ", newValue)
            }
    }
}

struct SizeHeaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct HeaderWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderWeatherView(
                weatherVM: WeatherViewModel(weatherService: WeatherService()))
                .previewLayout(.sizeThatFits)
            MainView()
        }
    }
}
