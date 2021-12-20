//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        GeometryReader { geoProxyMainView in
            VStack {
                HeaderWeatherView()
                    
                DailyWeatherListView()
            }
            .onAppear {
                print("высота MainView = \(geoProxyMainView.frame(in: .global).size.height)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
