//
//  PopularCitiesView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI
struct PopularCitiesView: View {
    @Binding var showMap: Bool
    @Binding var isShowMainView: Bool
    @EnvironmentObject var citiesVM: CitiesListViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    let firstCityFirstRow = 0
    let lastCityFirstRow = 2
    let firstCitySecondRow = 2
    let lastCitySecondRow = 5
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(Localization.popularCities.localized)
                        .popularCitiesText()
                    Spacer()
                }
            }
            .padding(.top, MagicNumber.x2)
            VStack(alignment: .leading, spacing: MagicNumber.x4) {
                HStack {
                    HStack {
                        Text(weatherVM.currentCity)
                            .foregroundColor(.currentLocation)
                        Image(Images.imageMapPin)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: MagicNumber.x4)
                    }
                    .popularCitiesStyle()
                    .onTapGesture {
                        isShowMainView.toggle()
                    }
                    ForEach(firstCityFirstRow..<lastCityFirstRow, id: \.self) { index in
                        Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                            .popularCitiesStyle()
                            .onTapGesture {
                                weatherVM.currentCity = PopularCitiesStorage.storage[index]
                                citiesVM.encodeCitiesToStorage(nameCity: PopularCitiesStorage.storage[index])
                                isShowMainView.toggle()
                            }
                    }
                }
                HStack {
                    ForEach(firstCitySecondRow..<lastCitySecondRow, id: \.self) { index in
                        Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                            .popularCitiesStyle()
                            .onTapGesture {
                                weatherVM.currentCity = PopularCitiesStorage.storage[index]
                                citiesVM.encodeCitiesToStorage(nameCity: PopularCitiesStorage.storage[index])
                                isShowMainView.toggle()
                            }
                    }
                }
            }
            .padding(.vertical, MagicNumber.x4)
            Divider()
                .foregroundColor(.primary)
            HStack {
                Button {
                    showMap.toggle()
                } label: {
                    Text(Localization.showMap.localized)
                        .foregroundColor(.currentLocation)
                }
                .fullScreenCover(isPresented: $showMap) {
                    SearchCitiesOnMapView()
                }
                Spacer()
            }
            .padding(.top, MagicNumber.x4)
        }
        .padding(.horizontal, MagicNumber.x4)
    }
}
