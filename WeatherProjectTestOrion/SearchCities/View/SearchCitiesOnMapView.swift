//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI
import MapKit
struct SearchCitiesOnMapView: View {
  @StateObject var mapVM = MapViewModel(weatherService: WeatherService())
  @State var searchTextFeild = ""
  @State var searchIsEditing = false
  @State var showSheet = false
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.locale) var locale
  var searchField: some View {
    HStack {
      HStack(alignment: .center) {
        Image(systemName: Constants.Icon.iconMagnifyingglass)
        TextField(Localization.search.localized, text: $searchTextFeild)
          .onTapGesture {
            searchIsEditing = true
          }
          .onSubmit {
            Task {
              await mapVM.findCity(cityName: searchTextFeild)
            }
            showSheet = true
            searchIsEditing.toggle()
          }
        if searchIsEditing {
          Button {
            searchTextFeild = ""
            searchIsEditing = false
          } label: {
            Image(systemName: Constants.Icon.iconButtonDeleteText)
              .foregroundColor(.buttonDeleteTextField)
          }
          .padding(.trailing, .main)
        }
      }
      .padding(.leading, .s2)
      .padding(.vertical, .main)
      .background(
        RoundedRectangle(cornerRadius: .s5)
          .foregroundColor(.searchBackground))
      .padding(.horizontal, .x2)
      if searchIsEditing {
        Button {
          searchTextFeild = ""
          presentationMode.wrappedValue.dismiss()
        } label: {
          Text(Localization.cancel.localized)
        }
        .padding(.trailing, .x2)
      }
    }
  }
  var titleNavigation: some View {
    HStack {
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Image(systemName: Constants.Icon.iconButtonBackToView)
          .backToViewButton()

      }
      Text(Localization.locations.localized)
      Spacer()
      Button {
        print("plus")
      } label: {
        Image(systemName: Constants.Icon.iconButtonAdd)
          .editListCitiesButton()
      }
    }
    .padding(.leading, .main)
    .padding(.trailing, .x2)
  }
  var mapView: some View {
    ZStack(alignment: .trailing) {
      GeometryReader { _ in
        Map(coordinateRegion: $mapVM.coordinateRegion,
            showsUserLocation: true,
            annotationItems: mapVM.annotationsMark) { item in
          MapMarker(coordinate: item.coordinate)
        }
            .ignoresSafeArea(edges: .bottom)
      }
      .onAppear {
        mapVM.checkIfLocationServicesEnabled()
      }
      if showSheet {
        GeometryReader { geometry in
          ZStack(alignment: .top) {
            SheetBottomWeatherView(coordinatesCityForNetwork: mapVM.coordinatesCityForNetwork,
                                   showSheet: $showSheet, mapVM: mapVM)
            VStack {
              Capsule()
                .fill(Color.gray)
                .frame(width: 36, height: 5)
                .padding(.top, .s3)
            }
            .frame(alignment: .top)
          }
          .offset(y: geometry.frame(in: .named("MAP")).height - 150)
        }
      }
      buttonsNavigationMap
        .padding(.trailing, .x2)
    }
    .coordinateSpace(name: "MAP")
  }
  var buttonsNavigationMap: some View {
    VStack(spacing: 4) {
      Group {
        Button {
          mapVM.zoomUp()
        } label: {
          Image(systemName: Constants.Icon.iconPlusCircle)
        }
        Button {
          mapVM.zoomDown()
        } label: {
          Image(systemName: Constants.Icon.iconMinusCircle)
        }
        Button {
          mapVM.requestCurrentLocation()
        } label: {
          Image(systemName: Constants.Icon.iconCurrentLocation)
        }
      }
      .font(.largeTitle)
      .symbolRenderingMode(.palette)
      .foregroundStyle(.black, .white)
      .shadow(radius: 2)
    }
  }
  var body: some View {
    VStack {
      if !searchIsEditing {
        titleNavigation
      }
      searchField
        .onChange(of: searchTextFeild) { _ in
          searchIsEditing = true
        }
      if !searchIsEditing {
        mapView
      }
      if searchIsEditing {
        List(CitiesStorage.citiesStorage.filter({ $0.contains(searchTextFeild)
        }), id: \.self) { city in
          Text(city)
            .onTapGesture {
              self.searchTextFeild = city
              searchIsEditing = false
              mapVM.annotationsMark = []
              Task {
                await mapVM.findCity(cityName: city)
              }
              showSheet = true
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        Spacer()
      }
    }
  }
}

struct SearchCitiesOnMapView_Previews: PreviewProvider {
  static var previews: some View {
    SearchCitiesOnMapView()
  }
}
