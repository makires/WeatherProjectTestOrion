//
//  MapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapVM: MapViewModel
    @Binding var changedHeight: CGFloat
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapVM.coordinateRegion,
                showsUserLocation: true,
                annotationItems: mapVM.annotationsMark) { item in
                MapMarker(coordinate: item.coordinate)
            }
            ButtonCurrentLocation(mapVM: mapVM)
            .padding(.trailing, MagicNumber.x5)
        }
        .ignoresSafeArea(edges: [.horizontal, .bottom])
        .onAppear {
            mapVM.checkIfLocationServicesEnabled()
        }
    }
}
