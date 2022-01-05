//
//  Localizable.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 05.01.2022.
//

import Foundation
import SwiftUI

#warning("почему при таком подходе не работает автоматическая генерация строк NSLocalizedString?")
// ответ: когда используется переменная, содержащая строку, данный подход не работает.
// необходимо прямое испольвазование NSLocalizedString("Текст-Текст", comment: "")
// утилита genstrings (поддерживает -SwiftUI)
// как сделать так, чтобы заработало?

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
    
    // MARK:- Cities Favorites
    case nizhnyNovgorod = "NIZHNY NOVGOROD"
    case sochi = "SOCHI"
    case novokuznetsk = "NOVOKUZNETSK"
    case prokopyevsk = "PROKOPYEVSK"
    
    // MARK:- Wind Directions
    
    case N = "N"
    case S = "S"
    case W = "W"
    case E = "E"
    case NE = "NE"
    case NW = "NW"
    case SE = "SE"
    case SW = "SW"
    case WNW = "WNW"
    case NNW = "NNW"
    case NNE = "NNE"
    case ENE = "ENE"
    case ESE = "ESE"
    case SSE = "SSE"
    case SSW = "SSW"
    case WSW = "WSW"
     
}
extension Localization {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
