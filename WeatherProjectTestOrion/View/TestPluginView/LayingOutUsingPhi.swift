//
//  LayingOutUsingPhi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 13.12.2021.
//

import SwiftUI

struct LayingOutUsingPhi: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
            Rectangle()
                .fill(Color.purple)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct LayingOutUsingPhi_Previews: PreviewProvider {
    static var previews: some View {
        LayingOutUsingPhi()
    }
}
