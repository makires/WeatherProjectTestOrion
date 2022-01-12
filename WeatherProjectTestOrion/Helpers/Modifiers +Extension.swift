//
//  Modifiers +Extension.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 31.12.2021.
//

import SwiftUI

struct TitleCity: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 80, weight: .thin))
    }
}
struct CurrentIcon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 78))
    }
}
extension View {
    func fontTitleCity() -> some View {
        modifier(TitleCity())
    }
    func fontCurrentIcon() -> some View {
        modifier(CurrentIcon())
    }

    func fontDesciprionConditionWeather() -> some View {
        modifier(DescriptionConditionWeather())
    }

    func fontDailyWeatherRow() -> some View {
        modifier(DailyWeatherRowModifier())
    }
    func fontCurrentTemperatureRowListCities() -> some View {
        modifier(TemperatureCurrentRowListCities())
    }
    func fontDescriptionWeatherRowListCities() -> some View {
        modifier(DescriptionWeatherRowListCities())
    }
    func fontDateWeather() -> some View {
        modifier(DateWeather())
    }
    func fontNameDateWeather() -> some View {
        modifier(NameDateWeather())
    }
    func editListCitiesButton() -> some View {
        modifier(EditListCitiesButton())
    }
    func backToViewButton() -> some View {
        modifier(BackMainViewButton())
    }
    func fontPopulareCities() -> some View {
        modifier(PopularCities())
    }
}
struct PopularCities: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .semibold))
    }
}
struct BackMainViewButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 24))
    }
}
struct EditListCitiesButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 17))
    }
}
struct DescriptionConditionWeather: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
    }
}
struct DateWeather: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13, weight: .regular))
    }
}
struct NameDateWeather: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .regular))
    }
}
struct DailyWeatherRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .regular))
    }
}
struct TemperatureCurrentRowListCities: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .regular))
    }

}
struct DescriptionWeatherRowListCities: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular))
    }
}

extension String {
    var languageResponse: String {
        let firstDash = self.firstIndex(of: "_") ?? self.endIndex
        let firstSymbolsLanguage = self[..<firstDash]
        return String(firstSymbolsLanguage)
    }
}
extension Color {
    static var mainText: Color {
        return Color("mainText")
    }
    static var mainTextWhite: Color {
        return Color("mainTextWhite")
    }
    static var subText: Color {
        return Color("subText")
    }
    static var measure: Color {
        return Color("measure")
    }
    static var borderCityRow: Color {
        return Color("borderCityRow")
    }
    static var iconWeatherCityRow: Color {
        return Color("iconWeatherCityRow")
    }
    static var showMap: Color {
        return Color("showMap")
    }
    static var popularCityBackground: Color {
        return Color("popularCitiesBackground")
    }
    static var popularCitiesOverlay: Color {
        return Color("popularCitiesOverlay")
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
extension Double {
    var temperatureConverterNotSign: String {
        if Int(self) > 0 {
            let plusTemperature = "\(Int(self))°"
            return plusTemperature
        } else {
            return String("\(Int(self))°".dropFirst())
        }
    }
}
