//
//  HourlyCurrentWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 29.12.2021.
//

import Foundation

struct HourlyCurrentWeather {
    var hours: [Hour] = []
    func createCurrentHours(response: APIForecastWeatherModel) -> [Hour] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let currentDate = dateFormatter.date(from: response.location.currentLocalTime) ?? Date()
        var hoursForShow: [Hour] = []
        if let hoursToday = response.forecast.forecastday.first?.hour {
            for hour in hoursToday {
                if Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch)) >= currentDate {
                    hoursForShow.append(hour)
                }
            }
        }
        return hoursForShow
    }
}
extension HourlyCurrentWeather {
    init(response: APIForecastWeatherModel) {
        hours = createCurrentHours(response: response)
    }
}
