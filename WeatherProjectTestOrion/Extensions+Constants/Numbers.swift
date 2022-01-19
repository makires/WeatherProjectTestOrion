//
//  Int.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 13.01.2022.
//

import Foundation

extension Int {
  var formattedHour: String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
  }
}

extension Int {
  var formattedDay: String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM"
    return dateFormatter.string(from: date)
  }
}

extension Int {
  var formattedNameDay: String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    dateFormatter.doesRelativeDateFormatting = true
    if dateFormatter.string(from: date) == "Today" ||
        dateFormatter.string(from: date) == "Tomorrow" ||
        dateFormatter.string(from: date) == "Сегодня" ||
        dateFormatter.string(from: date) == "Завтра" {
      return dateFormatter.string(from: date)
    } else {
      dateFormatter.dateFormat = "EEEE"
      return dateFormatter.string(from: date)
    }
  }
}
extension Int {
  var relativeFormatted: String {
    let formatter = RelativeDateTimeFormatter()
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    formatter.dateTimeStyle = .named
    let relativeDate = formatter.localizedString(for: date, relativeTo: Date())
    return relativeDate
  }
}

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
