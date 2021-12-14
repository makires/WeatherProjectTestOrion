//
//  ParallaxScrolling.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct ParallaxScrolling: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("map")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 1)
                    .scaleEffect(1.8)
                    .opacity(0.4)
                VStack(spacing: 20) {
                    Text("UTAH")
                        .font(.system(size: 30, weight: .black))
                    TileView(imageName: "Arches", tileLabel: "Arches")
                    TileView(imageName: "Canyonlands", tileLabel: "Canyonlands")
                    TileView(imageName: "BryceCanyon", tileLabel: "Bryce Canyon")
                    TileView(imageName: "GoblinValley", tileLabel: "Goblin Valley")
                    TileView(imageName: "Zion", tileLabel: "Zion")
                }
                .padding(.horizontal, 20)
            }.edgesIgnoringSafeArea(.vertical)
            
        }
    }
}

struct ParallaxScrolling_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxScrolling()
    }
}
