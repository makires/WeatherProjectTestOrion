//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI

struct SearchCitiesOnMapView: View {
    @State var searchTextFeild = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: iconButtonBackToView)
                        .backToViewButton()

                }
                Text(Localization.locations.localized)
                Spacer()
                Button {
                    print("plus")
                } label: {
                    Image(systemName: iconButtonDelete)
                        .editListCitiesButton()
                }
            }
            .padding(.leading, 6)
            .padding(.trailing, 10)
            // MARK: - "серый фон и иконка лупы, круглые углы")
            HStack {
                TextField(Localization.search.localized, text: $searchTextFeild)
            }
        }
    }
}

struct SearchCitiesOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCitiesOnMapView()
    }
}
