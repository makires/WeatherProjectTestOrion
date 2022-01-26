//
//  CitiesListViewBuilder.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 25.01.2022.
//

import SwiftUI

struct CitiesListViewBuilder {
    @MainActor static func view() -> some View {
      return ListLocationsView()
    }
}
