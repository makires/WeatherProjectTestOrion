//
//  ContentView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct MainView: View {
//    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
//        // If scrolling up, yOffset will be a negative number
//        if maxHeight + yOffset < minHeight {
//            // SCROLLING UP
//            // Never go smaller than our minimum height
//            return minHeight
//        }
//
//        // SCROLLING DOWN
//        return maxHeight + yOffset
//    }
    var body: some View {
        ScrollView {
            ZStack {
                
                VStack {
                    
                    ListDailyWeatherView()
                }
                .padding(.top, 325)
                
                // Top Layer
                GeometryReader { geo in
                    VStack {
                        HeaderWeatherView()
//                            .frame(height: self.calculateHeight(minHeight: 120, maxHeight: 300, yOffset: geo.frame(in: .global).origin.y))
//                            .offset(y: geo.frame(in: .global).origin.y < 0 // Is it gowing up?
//                                    ? abs(geo.frame(in: .global).origin.y) // Push it down!
//                                    : -geo.frame(in: .global).origin.y) // Push it up!
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
