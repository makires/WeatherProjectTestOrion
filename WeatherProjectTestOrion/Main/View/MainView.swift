//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
    @State var leftTopPointY: CGFloat = .zero
    @State var startLeftTopPointY: CGFloat = .zero
    @State var heightDetailsCurrentWeatherView: CGFloat = .zero
    
    var body: some View {
//        GeometryReader { geoProxyMainView in
            VStack(spacing: 0) {
                HeaderWeatherView(leftTopPointY: $leftTopPointY, startLeftTopPointY: $startLeftTopPointY, heightDetailsCurrentWeatherView: $heightDetailsCurrentWeatherView)
                    
                DailyWeatherListView(startLeftTopPointY: $startLeftTopPointY, leftTopPointY: $leftTopPointY, heightDetailsCurrentWeatherView: $heightDetailsCurrentWeatherView)
                    
            }
            .onAppear {
                print("появилась координата верхней ячейки startLeftTopPointY = \(startLeftTopPointY)")
                print("появилась NEW координата верхней ячейки leftTopPointY = \(leftTopPointY)")
//                print("высота MainView = \(geoProxyMainView.frame(in: .global).size.height)")
            }
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
