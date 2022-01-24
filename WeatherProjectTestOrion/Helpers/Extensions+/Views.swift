//
//  Views.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 13.01.2022.
//

import SwiftUI
// MARK: - modifiers
extension View {
    func fontTitleCity() -> some View {
        modifier(TitleCity())
    }

    func fontTitleCitySheet() -> some View {
        modifier(TitleCitySheet())
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
    func fontTemperatureCurrentForSheetCity() -> some View {
        modifier(TemperatureCurrentForSheetCity())
    }
    func fontIconCurrentWeatherForSheetCity() -> some View {
        modifier(IconCurrentWeatherForSheetCity())
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
    func popularCitiesStyle() -> some View {
        modifier(PopularCitiesStyle())
    }
    func currentLocationButtonStyle() -> some View {
        modifier(CurrentLocationButtonStyle())
    }
    func capsuleStyle() -> some View {
        modifier(CapsuleStyle())
    }
}
