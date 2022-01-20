//
//  Double.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 21.01.2022.
//

import Foundation

extension Double {
  var temperatureConverter: String {
    if Int(self) > 0 {
      let plusTemperature = "+\(Int(self))°"
      return plusTemperature
    } else {
      return "\(Int(self))°"
    }
  }
}
