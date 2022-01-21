//
//  Strings.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 13.01.2022.
//

import SwiftUI

extension String {
    var languageResponse: String {
        let firstDash = self.firstIndex(of: "_") ?? self.endIndex
        let firstSymbolsLanguage = self[..<firstDash]
        return String(firstSymbolsLanguage)
    }
}
