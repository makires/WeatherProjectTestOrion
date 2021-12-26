//
//  ModelWeatherapi.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//
//

import Foundation

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
    let windDirection: String
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

extension ConditionWeather {
    var iconName: String {
        switch code {
        case 1000:
            return "sun.max.fill"
        case 1003:
            return "cloud.sun.fill"
        case 1006:
            return "cloud.fill"
        case 1009:
            return "smoke.fill"
        case 1030, 1135, 1147:
            return "cloud.fog"
        case 1063, 1180, 1186, 1192, 1240, 1243:
            return "cloud.sun.rain.fill"
        case 1066, 1210, 1213, 1216, 1219, 1222, 1225, 1237, 1255, 1258:
            return "cloud.snow.fill"
        case 1069, 1072, 1204, 1207, 1249, 1252:
            return "cloud.sleet.fill"
        case 1087, 1276:
            return "cloud.bolt.fill"
        case 1114, 1117:
            return "wind.snow"
        case 1150, 1153, 1168, 1171, 1198, 1201:
            return "cloud.drizzle.fill"
        case 1183, 1189:
            return "cloud.rain.fill"
        case 1195, 1246:
            return "cloud.heavyrain.fill"
        case 1261, 1264:
            return "cloud.hail.fill"
        case 1273, 1279, 1282:
            return "cloud.sun.bolt.fill"
        default:
            return "thermometer"
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
//        dateFormatter.dateFormat = "EEEE"
        dateFormatter.doesRelativeDateFormatting = true
                dateFormatter.timeStyle = .none
                dateFormatter.dateStyle = .medium
//
//
//        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        print("это вывод по строке", dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
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
