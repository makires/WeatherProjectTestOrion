//
//  SearchFieldView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct SearchFieldOnMap: View {
    @Binding var searchIsEditing: Bool
    @Binding var searchTextField: String
    @Binding var showSheet: Bool
    @ObservedObject var mapVM: MapViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            HStack {
                Image(systemName: Icon.iconMagnifyingglass)
                TextField(Localization.search.localized, text: $searchTextField)
                    .onTapGesture {
                        searchIsEditing = true
                    }
                    .onSubmit {
                        Task {
                            await mapVM.findCity(cityName: searchTextField)
                        }
                        showSheet = true
                        searchIsEditing.toggle()
                    }
                if searchIsEditing {
                    Button {
                        searchTextField = ""
                        searchIsEditing = false
                    } label: {
                        Image(systemName: Icon.iconButtonDeleteText)
                            .foregroundColor(.buttonDeleteTextField)
                    }
                    .padding(.trailing, MagicNumber.x2)
                }
            }
            .padding(.leading, MagicNumber.x1)
            .padding(.vertical, MagicNumber.x2)
            .background(
                RoundedRectangle(cornerRadius: MagicNumber.x2)
                    .foregroundColor(.searchBackground))
            .padding(.horizontal, MagicNumber.x4)

            if searchIsEditing {
                Button {
                    searchTextField = ""
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(Localization.cancel.localized)
                }
                .padding(.trailing, MagicNumber.x4)
            }
        }
        .onChange(of: searchTextField) { _ in
            showSheet = true
            searchIsEditing = true
        }
    }
}
