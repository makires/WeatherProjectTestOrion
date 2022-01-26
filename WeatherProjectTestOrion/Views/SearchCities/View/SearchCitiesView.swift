//
//  SearchCitiesView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI

struct SearchCitiesView: View {
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    @State var searchCity = ""
    @State var showMap = false
    @State var isEditing = false
    @State var isShowMainView = false

    var body: some View {
        VStack(alignment: .leading) {
            SearchFieldView(
                searchCity: $searchCity,
                isEditing: $isEditing)
                .padding(.horizontal, MagicNumber.x4)
            Divider()
                .foregroundColor(.primary)
            if !isEditing {
                PopularCitiesView(showMap: $showMap,
                                  isShowMainView: $isShowMainView)
            } else {
                List(CitiesStorage.citiesStorage.filter({ $0.contains(searchCity) }), id: \.self) { city in
                    Text(city)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            weatherVM.currentCity = city
                            citiesVM.encodeCitiesToStorage(nameCity: city)
                            isShowMainView.toggle()
                        }
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowMainView) {
            ViewFactory.makeView(typeView: .main)
        }
    }
}
