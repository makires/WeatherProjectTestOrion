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
  func makeView(typeView: TypeView) {
    switch typeView {
    case .main:
      let mainView = MainView()
    case .list:
      let citiesListView = ListLocationsView()
    case .search:
      let searchCities = SearchCitiesView()
    }
  }
}






