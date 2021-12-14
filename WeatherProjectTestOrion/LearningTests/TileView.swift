//
//  TileView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct TileView: View {
    var imageName = ""
    var tileLabel = ""
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200, alignment: .bottom)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
            .overlay(VStack {
                Spacer()
                Text(tileLabel)
                    .padding(.bottom, 20)
                    .opacity(0.85)
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.white)
            })
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(imageName: "Arches", tileLabel: "Arches")
    }
}
