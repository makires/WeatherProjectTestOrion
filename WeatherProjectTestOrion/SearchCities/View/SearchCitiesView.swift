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
  let gridItems = [
    GridItem(.flexible()),
    GridItem(.flexible())]
  var body: some View {
    VStack {
      SearchFieldView(
        searchCity: $searchCity,
        isEditing: $isEditing)
        .padding(.trailing, 16)
        .padding(.leading, 8)
      Divider()
      // MARK: - Popular Cities View
      if !isEditing {
        VStack {
          HStack {
            Text(Localization.popularCities.localized).tracking(-0.41)
              .fontPopulareCities()
            Spacer()
          }
        }
        .padding(.leading, 16)
        
        LazyHGrid(rows: gridItems) {
          ForEach(citiesVM.citiesList, id: \.self) { city in
            Text(city)
              .onTapGesture {
                print("популряные города")
              }
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
      } else {
//        List(CitiesStorage.citiesStorage.filter({ $0.contains(searchCity) }), id: \.self) { city in
        List(CitiesStorage.citiesStorage.filter({ $0.contains(searchCity) }), id: \.self) { city in
          Text(city)
            .listRowSeparator(.hidden)
            .onTapGesture {
print("отфильтрованный город")
              weatherVM.currentCity = city
              citiesVM.encodeCitiesToStorage(nameCity: city)
              isShowMainView.toggle()
            }
        }
        .fullScreenCover(isPresented: $isShowMainView) {
          MainView()
        }
        .listStyle(.plain)
      }
      Spacer()
    }
  }
}
struct SearchFieldView: View {
  @Binding var searchCity: String
  @Binding var isEditing: Bool
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    HStack {
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Image(systemName: iconButtonBackToView)
          .backToViewButton()
      }
      TextField(
        Localization.enterLocation.localized,
        text: $searchCity)
        .onTapGesture {
          isEditing = true
        }
      Button {
        searchCity = ""
      } label: {
        Image(systemName: iconButtonDelete)
          .frame(width: 44, height: 44)
          .editListCitiesButton()
      }
    }
  }
}
