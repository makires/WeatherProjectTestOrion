//
//  ListLocationsView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 27.12.2021.
//

import SwiftUI

struct ListLocationsView: View {
    
    @StateObject var citiesVM = CitiesListViewModel(weatherService: WeatherService())
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale.identifier) var locale
    @State var editList = false
    var body: some View {
        ScrollView {
// temporary ========================
Button("Refresh") {
    citiesVM.citiesData = ["Nizhny Novgorod", "Sochi"].encodeArray()!
    let decoder = JSONDecoder()
    if let citiesFromAppStorage = try? decoder.decode([String].self, from: citiesVM.citiesData) {
        citiesVM.citiesList = citiesFromAppStorage
    }
}
Button("Addcity") {
    citiesVM.citiesList.append("Kazan")
}
// temporary ========================
            ForEach(citiesVM.citiesList, id: \.self) { cityName in
                CityRowView(cityName: cityName, editList: $editList, citiesVM: citiesVM)
//
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
            citiesVM.getCitiesFromAppStorage()
        }
    }
    
    
}

struct ListLocationsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ListLocationsView()
        }
    }
}
