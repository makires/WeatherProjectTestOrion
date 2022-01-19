//
//  Location.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.01.2022.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}
