//
//  Cities.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 29.12.2021.
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
