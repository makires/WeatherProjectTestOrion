//
//  TitleNavigationOnMap.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 24.01.2022.
//

import SwiftUI

struct TitleNavigationOnMap: View {
    @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: Icon.iconButtonBackToView)
                    .backToViewButton()
            }
            Text(Localization.locations.localized)
            Spacer()
        }
        .padding(.horizontal, MagicNumber.x4)
    }
}
