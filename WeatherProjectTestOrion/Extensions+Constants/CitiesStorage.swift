//
//  CitiesStorage.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.01.2022.
//

import Foundation
//  все через структуру
struct CitiesStorage {
  static let citiesStorage = [
    "Moscow",
    "Saint Petersburg",
    "Novosibirsk",
    "Yekaterinburg",
    "Kazan",
    "Nizhny Novgorod",
    "Chelyabinsk",
    "Samara",
    "Omsk",
    "Rostov-on-Don",
    "Ufa",
    "Krasnoyarsk",
    "Voronezh",
    "Perm",
    "Volgograd",
    "Krasnodar",
    "Saratov",
    "Tyumen",
    "Barnaul",
    "Irkutsk",
    "Sochi",
    "Novokuznetsk"
  ]
}
enum PopularCitiesStorage: String, CaseIterable {
  case locate = "LOCATE"
  case moscow = "MOSCOW"
  case saintPetersburg = "ST.PETERSBURG"
  case kaliningrad = "KALININGRAD"
  case yekaterinburg = "YEKARINBURG"
  case omsk = "OMSK"
}
extension PopularCitiesStorage {
  var localized: String {
    return NSLocalizedString(self.rawValue, comment: "")
  }
}
