//
//  BlurView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.01.2022.
//

import Foundation
import SwiftUI

struct SheetBottomWeatherView: View {
    var coordinatesCityForNetwork: String
    @Binding var showSheet: Bool
    @ObservedObject var mapVM: MapViewModel
    @State var isShowMainView = false
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var weatherVM: WeatherViewModel
    @EnvironmentObject var citiesVM: CitiesListViewModel

    var body: some View {
        GeometryReader { _ in
            VStack {
                Capsule()
                    .fill(Color.gray)
                    .capsuleStyle()
                WeatherOnSheetBottom(mapVM: mapVM)
                    .padding(.horizontal, MagicNumber.x4)
                ButtonsOnSheetBottom(showSheet: $showSheet, isShowMainView: $isShowMainView, mapVM: mapVM)
                    .padding(.top, MagicNumber.x6)
                    .padding(.bottom, MagicNumber.x16)
                    .padding(.trailing, MagicNumber.x4)
            }
        }
        .background(colorScheme == .dark ? .black : .white)
        .cornerRadius(MagicNumber.x2)
        .fullScreenCover(isPresented: $isShowMainView) {
            MainView()
        }
    }
}
