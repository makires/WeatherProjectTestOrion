//
//  MapDetails.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import Foundation
import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(
        latitude: 56.325076446859434,
        longitude: 43.93714727621532)
    static var defaultSpan = MKCoordinateSpan(
        latitudeDelta: 0.2,
        longitudeDelta: 0.2)
}
