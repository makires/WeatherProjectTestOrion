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
    
    func fontDesciprion() -> some View {
        modifier(DescriptionWeather())
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
}

struct DescriptionWeather: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
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
