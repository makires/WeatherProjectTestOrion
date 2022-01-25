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

struct TitleCitySheet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .regular))
    }
}

struct CurrentIcon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 78))
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
            .foregroundColor(.primary)
            .font(.system(size: 18))
    }
}

struct EditListCitiesButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.primary)
            .font(.system(size: 16))
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

struct TemperatureCurrentForSheetCity: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .regular))
    }

}

struct IconCurrentWeatherForSheetCity: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .regular))
    }
}

struct DescriptionWeatherRowListCities: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular))
    }
}

struct PopularCitiesStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .lineSpacing(8)
            .padding(.horizontal, MagicNumber.x2)
            .padding(.vertical, MagicNumber.x2)
            .background(Color.popularCityBackground)
            .cornerRadius(MagicNumber.x4)
            .overlay(
                RoundedRectangle(cornerRadius: MagicNumber.x4)
                    .stroke(Color.popularCitiesOverlay, lineWidth: 1))
    }
}

struct CurrentLocationButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.black, .white)
            .shadow(radius: MagicNumber.x05)
    }
}

struct CapsuleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 36, height: 5)
            .padding(.top, MagicNumber.x2)
    }
}
