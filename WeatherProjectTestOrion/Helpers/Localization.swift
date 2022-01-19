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
  
  // MARK: - Cities Favorites
  case locate = "LOCATE"
  case moscow = "MOSCOW"
  case saintPetersburg = "ST.PETERSBURG"
  case kaliningrad = "KALININGRAD"
  case yekaterinburg = "YEKARINBURG"
  case omsk = "OMSK"
  
  case nizhnyNovgorod = "NIZHNY NOVGOROD"
  case sochi = "SOCHI"
  case novokuznetsk = "NOVOKUZNETSK"
  case prokopyevsk = "PROKOPYEVSK"
  
  // MARK: - Search Cities
  case enterLocation = "ENTER_LOCATION"
  case popularCities = "POPULAR CITIES"
  case showMap = "SHOW_MAP"
  case search = "SEARCH"
  // MARK: - Buttons
  case cancel = "CANCEL"
  case add = "ADD"
}
extension Localization {
  var localized: String {
    return NSLocalizedString(self.rawValue, comment: "")
  }
}
