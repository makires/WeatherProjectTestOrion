//
//  ViewFactory.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 25.01.2022.
//

import SwiftUI

struct ViewFactory {
  enum TypeView {
    case main
    case list
    case search
  }
    @MainActor @ViewBuilder static func makeView(typeView: TypeView) -> some View {
    switch typeView {
    case .main:
      MainViewBuilder.view()
    case .list:
      CitiesListViewBuilder.view()
    case .search:
      SearchCitiesViewBuilder.view()
    }
  }
}
