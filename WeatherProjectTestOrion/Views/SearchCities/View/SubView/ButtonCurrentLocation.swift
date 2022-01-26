//
//  ButtonCurrentLocation.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct ButtonCurrentLocation: View {
    @ObservedObject var mapVM: MapViewModel
  
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    mapVM.requestCurrentLocation()
                } label: {
                    Image(systemName: Icon.iconCurrentLocation)
                }
                .currentLocationButtonStyle()
            }
            Spacer()
        }
    }
}
