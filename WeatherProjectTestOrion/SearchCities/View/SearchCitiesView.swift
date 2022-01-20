//
//  SearchCitiesView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI

struct SearchCitiesView: View {
  func changeCurrentCity(city: String) {
    weatherVM.currentCity = city
    citiesVM.encodeCitiesToStorage(nameCity: city)
    isShowMainView.toggle()
  }
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
        .padding(.trailing, 16)
        .padding(.leading, 8)
      Divider()
      // MARK: - Popular Cities View
      if !isEditing {
        Group {
        VStack {
          HStack {
            Text(Localization.popularCities.localized)
              .tracking(-0.41)
              .fontPopulareCities()
            Spacer()
          }
        }
        .padding(.top, 8)
        VStack(alignment: .leading, spacing: 16) {
          HStack {
            HStack {
            Text(weatherVM.currentCity)
                .foregroundColor(.currentLocation)
              Image(imageMapPin)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: heightMappin)
            }
            .popularCitiesStyle()
            .onTapGesture {
              isShowMainView.toggle()
            }
            ForEach(0..<2, id: \.self) { index in
              Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                .popularCitiesStyle()
                .onTapGesture {
                  changeCurrentCity(city: PopularCitiesStorage.storage[index])
                }
            }
          }
          HStack {
            ForEach(2..<5, id: \.self) { index in
              Text(LocalizedStringKey( PopularCitiesStorage.storage[index] ))
                .popularCitiesStyle()
                .onTapGesture {
                  changeCurrentCity(city: PopularCitiesStorage.storage[index])
                }
            }
          }
        }
        .padding(.vertical, 16)
        Divider()
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
        .padding(.top, 16)
      }
        .padding(.horizontal, 16)
      } else {
        List(CitiesStorage.citiesStorage.filter({ $0.contains(searchCity) }), id: \.self) { city in
          Text(city)
            .listRowSeparator(.hidden)
            .onTapGesture {
              changeCurrentCity(city: city)
            }
        }
        .listStyle(.plain)
      }
      Spacer()
    }
    .fullScreenCover(isPresented: $isShowMainView) {
      MainView()
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
          .padding(10)
          .editListCitiesButton()
      }
    }
  }
}
