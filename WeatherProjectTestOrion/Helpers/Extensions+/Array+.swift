//
//  Array+.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 21.01.2022.
//

import Foundation

extension Array where Element == String {
    func encodeArray() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
}
