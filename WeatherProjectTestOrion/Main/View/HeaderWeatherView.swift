//
//  HeaderWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct HeaderWeatherView: View {
    var backgroundHeaderWeatherView = "cloudyBackground"
    var cityTitle = "Nizhny Novgorod"
    var currentWeatherIcon = "Cloudy"
    var currentTemperature = "+16°"
    var descriptionCurrentWeather = "Cloudy, Feels like +20°"
    @Binding var leftTopPointY: CGFloat
    @Binding var startLeftTopPointY: CGFloat
    
    // передать высоту details в иерархии для падиинга(или offset) в dailyWeather list
    
    @ObservedObject var weatherVM = WeatherViewModel(weatherService: WeatherService() )
    
    var body: some View {
        
        GeometryReader { geoProxyHeader in
            ZStack {
                Image(backgroundHeaderWeatherView)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.vertical)
                    .frame(height: geoProxyHeader.size.height/3)
                VStack {
                    HStack {
//                        Text(cityTitle )
                        Text("\(startLeftTopPointY)" )
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
                    
                    CurrentWeatherView(currentTemperature: weatherVM.currentTemperatute,
                                       descriptionCurrentTemperature: weatherVM.feelsLikeTemperature,
                                       currentWeatherIcon: currentWeatherIcon)
                        .padding(.horizontal, 16)
    //                GeometryReader { geoProxyDetailsCurrentWeather in
                        
       DetailsForCurrentWeatherView()
                    // изменение прозрачности
                        .opacity(leftTopPointY < startLeftTopPointY ? 0 : 1)
                        .background(
                            GeometryReader { geoProxyDetails in
                                Color.clear
                                    .onAppear {
                                        <#code#>
                                    }
                            })
                    
//    .frame(height: geoProxyHeader.size.height/4)
    .font(.system(size: 12, weight: .regular))
    .padding(EdgeInsets(top: 8, leading: 16, bottom: 30, trailing: 0))
    .background(
        GeometryReader { geoProxyDetailsCurrentWeather in
            //изменение цвета на Color.white
//            Color.gray
            if leftTopPointY < 237 {
                Color.white
                    .onAppear {
                        print("высота серой DetailsForCurrentWeatherView = \(geoProxyDetailsCurrentWeather.frame(in: .global).size.height) and header/4 = \(geoProxyHeader.size.height/4)")
                    }
            } else {
            Color.clear
                    .onAppear {
                        print("высота чистой DetailsForCurrentWeatherView = \(geoProxyDetailsCurrentWeather.frame(in: .global).size.height) and header/4 = \(geoProxyHeader.size.height/4)")
                    }
            }
            
            
                                   
                                }
                            )
                    
                }
                
            }
            
            .coordinateSpace(name: "HeaderZStack")
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .onAppear {
                weatherVM.getCurrentWeather(for: cityTitle)
        }
        }
        .border(.green, width: 2)
        
        
    }
}

struct HeaderWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            HeaderWeatherView()
//                .previewLayout(.sizeThatFits)
            MainView()
            
        }
    }
}
