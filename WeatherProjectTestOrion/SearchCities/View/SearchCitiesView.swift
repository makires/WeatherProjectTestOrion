//
//  SearchCitiesView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI

struct SearchCitiesView: View {
    @ObservedObject var cityVM: CitiesListViewModel
    @State var searchCity = ""
    @State var showMap = false
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    var body: some View {
        VStack {
            SearchFieldView(searchCity: $searchCity)
                .padding(.trailing, 16)
                .padding(.leading, 8)
            Divider()
            VStack {
                HStack {
                    Text(Localization.popularCities.localized).tracking(-0.41)
                        .fontPopulareCities()
                    Spacer()
                }
            }
            .padding(.leading, 16)
            // MARK: - Popular Cities View
            LazyHGrid(rows: gridItems) {
                ForEach(cityVM.citiesList, id: \.self) { city in
                            Text(city)
                                .font(.footnote)
                                .lineSpacing(18)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.popularCityBackground)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.popularCitiesOverlay, lineWidth: 1))
                        }
                }
            .padding(.leading, 16)

            Divider()
                .padding(.horizontal, 16)
            HStack {
                Button {
                    showMap.toggle()
                } label: {
                    Text(Localization.showMap.localized)
                        .foregroundColor(Color.showMap)

                }
                .fullScreenCover(isPresented: $showMap) {
                    SearchCitiesOnMapView()
            }
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 16)
Spacer()
        }
    }
}

struct SearchCitiesView_Previews: PreviewProvider {
    @State static var searchCity = ""
    static var previews: some View {
        Group {
            SearchCitiesView(cityVM: CitiesListViewModel(weatherService: WeatherService()))
                .previewLayout(.fixed(width: 300, height: 400))
            SearchFieldView(searchCity: $searchCity)
        }
        .previewLayout(.sizeThatFits)
    }
}

struct SearchFieldView: View {
    @Binding var searchCity: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: iconButtonBackToView)
                    .backToViewButton()
            }
            TextField(Localization.enterLocation.localized, text: $searchCity)
            Button {
                searchCity = ""
            } label: {
                Image(systemName: iconButtonDelete)
                    .frame(width: 44, height: 44)
                    .editListCitiesButton()
                    .rotationEffect(Angle(degrees: rotationEffectForButtonDeleteCity))
            }

        }
    }
}
