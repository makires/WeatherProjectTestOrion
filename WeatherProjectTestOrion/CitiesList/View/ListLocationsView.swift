//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
    @AppStorage("cities") var citiesDataStorage = CitiesListDataStorage(cities:
                                                  ["Nizhny Novgorod", "Sochi"]).encode()!
    @State var citiesList: [String] = []
    @State var editList = false
    @Environment(\.presentationMode) var presentationMode
    var weather: Weather
    var body: some View {
        ScrollView {
            Button("Refresh") {
                citiesDataStorage = CitiesListDataStorage(cities:
                                                              ["Nizhny Novgorod", "Sochi"]).encode()!
            }
            ForEach(citiesList, id: \.self) { cityName in
                CityRowView(cityName: cityName, weather: weather, editList: $editList, citiesList: $citiesList)
        }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editList.toggle()
                } label: {
                    Image(systemName: editList ? "checkmark" :  "square.and.pencil")
                        .foregroundColor(.black)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Locations"))
        .onAppear {
            getAppStorageData()
            if citiesDataStorage.isEmpty {
                citiesDataStorage = CitiesListDataStorage(cities:
                                                              ["Nizhny Novgorod", "Sochi"]).encode()!
            }
        }
    }

    func getAppStorageData() {
        if let appStorageCities = CitiesListDataStorage.decode(citiesListData: citiesDataStorage) {
            citiesList = appStorageCities.cities
        }
    }
}

 struct ListLocationsView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ListLocationsView(weather: Weather())
        }
    }
 }
