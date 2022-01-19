//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
  @EnvironmentObject var citiesVM: CitiesListViewModel
  @EnvironmentObject var weatherVM: WeatherViewModel
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.locale.identifier) var locale
  @State var editList = false
  @State var showAddCity = false
  @State var showMainView = false
  var body: some View {
    NavigationView {
      VStack {
        ScrollView {
          VStack(spacing: 2) {
              ForEach(citiesVM.arrayWeather) { weather in
              CityRowView(
                cityName: weather.cityName,
                weather: weather,
                editListCities: $editList)
                .onTapGesture {
                  weatherVM.currentCity = weather.cityName
                  showMainView.toggle()
                }
            }
          }
        }
        HStack {
          Button {
            showAddCity.toggle()
          } label: {
            Label(Localization.addLocation.localized, systemImage: iconButtonAddLocation)
              .foregroundColor(.blue)
          }
          Spacer()
        }
        .padding(.leading, 16)
      }
      .fullScreenCover(isPresented: $showMainView) {
        MainView()
      }
      .fullScreenCover(isPresented: $showAddCity) {
        SearchCitiesView()
      }
      .toolbar {
        ToolbarItem(placement: .navigation) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image(systemName: iconButtonBackToView)
              .backToViewButton()
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            editList.toggle()
          } label: {
            Image(systemName: editList ? iconButtonActivEditList :  iconButtonNotActivEditList)
              .editListCitiesButton()
          }
        }
      }
      .navigationBarBackButtonHidden(true)
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle(Localization.locations.localized)
      .onAppear {
        print("экран - список городов")
        Task {
          await citiesVM.getWeatherForCities()
        }
      }
    }
  }
}
