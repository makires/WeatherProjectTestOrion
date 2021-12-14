//
//  StickyHeader.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct StickyHeader: View {
    
    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
        // If scrolling up, yOffset will be a negative number
        if maxHeight + yOffset < minHeight {
            // SCROLLING UP
            // Never go smaller than our minimum height
            return minHeight
        }
        
        // SCROLLING DOWN
        return maxHeight + yOffset
    }
    
    
    var body: some View {
        ScrollView {
            ZStack {
                //Bottom layer
                VStack(spacing: 20) {
                    TileView(imageName: "Arches", tileLabel: "Arches")
                    TileView(imageName: "Canyonlands", tileLabel: "Canyonlands")
                    TileView(imageName: "BryceCanyon", tileLabel: "Bryce Canyon")
                    TileView(imageName: "GoblinValley", tileLabel: "Goblin Valley")
                    TileView(imageName: "Zion", tileLabel: "Zion")
                }
                .padding(.horizontal, 20)
                .padding(.top, 300)
                
                //Header Layer
                GeometryReader { geo in
                    VStack {
                        Image("Utah")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: self.calculateHeight(minHeight: 120, maxHeight: 300, yOffset: geo.frame(in: .global).origin.y))
                            .overlay (
                                Text("UTAH")
                                    .font(.system(size: 70, weight: .black))
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                            )
                            .offset(y: geo.frame(in: .global).origin.y < 0 // Is it gowing up?
                                    ? abs(geo.frame(in: .global).origin.y) // Push it down!
                                    : -geo.frame(in: .global).origin.y) // Push it up!
                        Spacer()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct StickyHeader_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeader()
    }
}
