//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI
import MapKit

struct SearchCitiesOnMapView: View {
    let heightFrame: CGFloat = 190
    let hideSheetBottom: CGFloat = 100
    @StateObject var mapVM = MapViewModel(weatherService: WeatherService())
    @State var heightSheet: CGFloat = .zero
    @State var changedHeight: CGFloat = .zero
    @State var searchTextField = ""
    @State var searchIsEditing = false
    @State var showSheet = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if !searchIsEditing {
                TitleNavigationOnMap()
            }
            SearchFieldOnMap(searchIsEditing: $searchIsEditing,
                             searchTextField: $searchTextField,
                             showSheet: $showSheet,
                             mapVM: mapVM)
            if !searchIsEditing {
                ZStack(alignment: .bottom) {
                    MapView(mapVM: mapVM, changedHeight: $changedHeight)
                    if showSheet {
                        SheetBottomWeatherView(
                            coordinatesCityForNetwork: mapVM.coordinatesCityForNetwork,
                            showSheet: $showSheet,
                            mapVM: mapVM
                        )
                            .onAppear(perform: {
                                changedHeight = .zero
                            })
                            .frame(height: heightFrame)
                            .offset(y: changedHeight < .zero ? .zero : changedHeight)
                            .gesture(
                                DragGesture()
                                    .onChanged { dragValue in
                                        self.changedHeight = dragValue.location.y
                                    }
                                    .onEnded { _ in
                                        if self.changedHeight > hideSheetBottom {
                                            showSheet = false
                                            changedHeight = .zero
                                        }
                                    })
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                .coordinateSpace(name: "MAP")
            } else {
                ListCitiesOnMap(searchTextField: $searchTextField, mapVM: mapVM)
            }
        }
        .alert(item: $mapVM.showAlertData) { _ in
            Alert(title: Text(mapVM.showAlertData!.title))
        }
    }
}

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
