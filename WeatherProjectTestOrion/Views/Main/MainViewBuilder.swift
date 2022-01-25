//
//  MainViewBuilder.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 25.01.2022.
//

import SwiftUI

struct MainViewBuilder {

    @MainActor static func view() -> some View {
        let viewModel = WeatherViewModel(weatherService: DIContainer.shared.weatherService)
        return MainView(weatherVM: viewModel)
    }
}
