//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//
//

import Foundation
import SwiftUI

struct APICurrentWeatherModel: Decodable {
    let location: Location
    let current: APICurrentWeather
}

struct Location: Decodable {
    let cityName: String
    let currentLocalTime: String
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case currentLocalTime = "localtime"
    }
}

struct APICurrentWeather: Decodable {
    let temperatureCurrent: Double
    let pressureHPa: Int
    let windKph: Double
    let windDirection: WindDirection
    let humidity: Int
    let feelsLikeTemperature: Double
    let isDay: Int
    let condition: ConditionWeather

    enum CodingKeys: String, CodingKey {
        case temperatureCurrent = "temp_c"
        case pressureHPa = "pressure_mb"
        case windKph = "wind_kph"
        case windDirection = "wind_dir"
        case humidity
        case feelsLikeTemperature = "feelslike_c"
        case isDay = "is_day"
        case condition
    }
}

enum WindDirection: String, Decodable {
    case north = "N"
    case south = "S"
    case west = "W"
    case east = "E"
    case northEast = "NE"
    case northWest = "NW"
    case southEast = "SE"
    case southWest = "SW"
    case westNorthWest = "WNW"
    case northNorthWest = "NNW"
    case northNorthEast = "NNE"
    case eastNorthEast = "ENE"
    case eastSouthEast = "ESE"
    case southSouthEast = "SSE"
    case southSouthWest = "SSW"
    case westSouthWest = "WSW"
}

struct ConditionWeather: Decodable {
    let text: String
    let iconURL: String
    let code: Int
    enum CodingKeys: String, CodingKey {
        case text
        case iconURL = "icon"
        case code
    }
}

enum WeatherIcon: String {
    case clearDay = "sun.max.fill"
    case partlyCloudy = "cloud.sun.fill"
    case cloudy = "cloud.fill"
    case overcast = "smoke.fill"
    case fog = "cloud.fog.fill"
    case rain = "cloud.sun.rain.fill"
    case moderateRain = "cloud.rain.fill"
    case heavyRain = "cloud.heavyrain.fill"
    case drizzle = "cloud.drizzle.fill"
    case snow = "cloud.snow.fill"
    case sleet = "cloud.sleet.fill"
    case windSnow = "wind.snow"
    case hail = "cloud.hail.fill"
    case bolt = "cloud.bolt.fill"
    case boltDay = "cloud.sun.bolt.fill"
    case other = "thermometer"
}
#warning("сделать через енум")
extension ConditionWeather {
    var iconName: String {
        switch code {
        case 1000:
            return WeatherIcon.clearDay.rawValue
        case 1003:
            return WeatherIcon.partlyCloudy.rawValue
        case 1006:
            return WeatherIcon.cloudy.rawValue
        case 1009:
            return WeatherIcon.overcast.rawValue
        case 1030, 1135, 1147:
            return WeatherIcon.fog.rawValue
        case 1063, 1180, 1186, 1192, 1240, 1243:
            return WeatherIcon.rain.rawValue
        case 1066, 1210, 1213, 1216, 1219, 1222, 1225, 1237, 1255, 1258:
            return WeatherIcon.snow.rawValue
        case 1069, 1072, 1204, 1207, 1249, 1252:
            return WeatherIcon.sleet.rawValue
        case 1087, 1276:
            return WeatherIcon.bolt.rawValue
        case 1114, 1117:
            return WeatherIcon.windSnow.rawValue
        case 1150, 1153, 1168, 1171, 1198, 1201:
            return WeatherIcon.drizzle.rawValue
        case 1183, 1189:
            return WeatherIcon.moderateRain.rawValue
        case 1195, 1246:
            return WeatherIcon.heavyRain.rawValue
        case 1261, 1264:
            return WeatherIcon.hail.rawValue
        case 1273, 1279, 1282:
            return WeatherIcon.boltDay.rawValue
        default:
            return WeatherIcon.other.rawValue
        }
    }
}

struct APIForecastWeatherModel: Decodable {
    let forecast: APIForecastWeather
    let location: Location
}

struct APIForecastWeather: Decodable {
    let forecastday: [Forecastday]
}

struct Forecastday: Decodable {
    let id = UUID()
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case day
        case hour
    }
}

struct Hour: Decodable, Identifiable {
    let id = UUID()
    let timeEpoch: Int
    let time: String
    let temperatureCelcius: Double
    let condition: ConditionWeather

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case temperatureCelcius = "temp_c"
        case condition
    }
}

struct Day: Decodable {
    let maxTemperatureCelcius: Double
    let minTemperatureCelcius: Double
    let condition: ConditionWeather
    enum CodingKeys: String, CodingKey {
        case maxTemperatureCelcius = "maxtemp_c"
        case minTemperatureCelcius = "mintemp_c"
        case condition
    }
}

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
