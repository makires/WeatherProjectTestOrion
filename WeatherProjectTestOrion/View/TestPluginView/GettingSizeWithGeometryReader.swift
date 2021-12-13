//
//  GettingSizeWithGeometryReader.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 13.12.2021.
//

import SwiftUI

struct GettingSizeWithGeometryReader: View {
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                Text("Height: \(geo.size.height)")
                Text("Width: \(geo.size.width)")
            }
        }
        .font(.largeTitle)
            .edgesIgnoringSafeArea(.vertical)
    }
}

struct GettingSizeWithGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GettingSizeWithGeometryReader()
    }
}
