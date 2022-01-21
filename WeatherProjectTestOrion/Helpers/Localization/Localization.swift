//
//  Localizable.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 05.01.2022.
//

import Foundation
import SwiftUI

enum Localization: String {
    // MARK: - List Locations (Cities)
    case locations = "LOCATIONS"
    case addLocation = "ADD_LOCATION"
    case now = "NOW"
    // MARK: - Weather elements
    case feelsLike = "FEELS_LIKE"
    case humidity = "HUMIDITY"
    case kmH = "KM/H"
    case hPa = "H_PA"
    // MARK: - Search Cities
    case enterLocation = "ENTER_LOCATION"
    case popularCities = "POPULAR CITIES"
    case showMap = "SHOW_MAP"
    case search = "SEARCH"
    // MARK: - Buttons
    case cancel = "CANCEL"
    case add = "ADD"
  
  case errorDenied = "CHECK AUTHORIZATION"
  case errorRestricted = "CHECK PARENT CONTROL"
  case locationOff = "LOCATION OFF"
  case geocoderError = "GEOCODER ERROR"
}
extension Localization {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
