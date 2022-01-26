//
//  ListCitiesOnMap.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct ListCitiesOnMap: View {
    @Binding var searchTextField: String
    @ObservedObject var mapVM: MapViewModel

    var body: some View {
        VStack {
            List(CitiesStorage.citiesStorage.filter({ $0.contains(searchTextField)
            }), id: \.self) { city in
                Text(city)
                    .onTapGesture {
                        self.searchTextField = city
                        mapVM.annotationsMark = []
                        Task {
                            await mapVM.findCity(cityName: city)
                        }
                    }
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            Spacer()
        }
    }
}
