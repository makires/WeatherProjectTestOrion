//
//  ButtonsOnSheetBottom.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct ButtonsOnSheetBottom: View {
    @Binding var showSheet: Bool
    @Binding var isShowMainView: Bool
    @ObservedObject var mapVM: MapViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    var body: some View {
        HStack(spacing: MagicNumber.x8) {
            Spacer()
            Button(action: {
                showSheet = false
            }, label: {
                Text(Localization.cancel.localized)
            })
                .foregroundColor(.secondary)
            Button(action: {
                guard let searchedCity = mapVM.annotationsMark.first?.name else { return }
                weatherVM.currentCity = searchedCity
                citiesVM.encodeCitiesToStorage(nameCity: searchedCity)
                isShowMainView.toggle()
            }, label: {
                Text(Localization.add.localized)
            })
        }
    }
}
