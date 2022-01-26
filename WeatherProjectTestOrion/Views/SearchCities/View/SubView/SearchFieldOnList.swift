//
//  SearchFieldCities.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var searchCity: String
    @Binding var isEditing: Bool
    @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: Icon.iconButtonBackToView)
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
                Image(systemName: Icon.iconButtonDelete)
                    .padding(MagicNumber.x2)
                    .editListCitiesButton()
            }
        }
    }
}
