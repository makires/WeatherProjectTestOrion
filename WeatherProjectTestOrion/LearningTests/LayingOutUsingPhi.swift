//
//  LayingOutUsingPhi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct LayingOutUsingPhi: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: geo.size.height * 0.38)
                    .overlay(Text("Height: \(geo.size.height * 0.38)"))
                
                GeometryReader { inner_geo in
                    Rectangle()
                        .fill(inner_geo.size.height > 600 ? Color.pink : Color.purple)
                    .overlay(Text("Height: \(geo.size.height * 0.62)"))
                }
            }
        }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct LayingOutUsingPhi_Previews: PreviewProvider {
    static var previews: some View {
        LayingOutUsingPhi()
    }
}
