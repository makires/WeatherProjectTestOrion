//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI
import MapKit
struct SearchCitiesOnMapView: View {
    @StateObject var mapVM = MapViewModel()
    @State var searchTextFeild = ""
    @State var searchIsEditing = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack {
                if !searchIsEditing {
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
                        Image(systemName: iconButtonAdd)
                            .editListCitiesButton()
                    }
                }
                .padding(.leading, 6)
                .padding(.trailing, 16)
                }
                HStack {
                    HStack(alignment: .center) {
                        Image(systemName: iconMagnifyingglass)
                        TextField(Localization.search.localized, text: $searchTextFeild)
                            .onSubmit {
                                mapVM.findCity(city: searchTextFeild)
                                searchIsEditing.toggle()
                            }
                            .onTapGesture {
                                searchIsEditing.toggle()
                            }
                        if searchIsEditing {
                        Button {
                            searchTextFeild = ""
                            searchIsEditing = false
                        } label: {
                            Image(systemName: iconButtonDeleteText)
                                .foregroundColor((Color.buttonDeleteTextField))
                        }
                        .padding(.trailing, 6)
                        }
                    }
                    .padding(.leading, 4)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor((Color.searchBackground)))
                .padding(.horizontal, 16)
                    if searchIsEditing {
                    Button {
                        searchTextFeild = ""
                        searchIsEditing = false
                    } label: {
                        Text(Localization.cancel.localized)
                    }
                    .padding(.trailing, 16)
                    }
                }
                if !searchIsEditing {

                    ZStack(alignment: .trailing) {
                        Map(coordinateRegion: $mapVM.coordinateRegion, showsUserLocation: true)
                            .ignoresSafeArea(edges: .bottom)
                        VStack(spacing: 4) {
                            Group {
                                Button {
                                    print("увеличить")
                                } label: {
                                    Image(systemName: iconPlusCircle)
                                }
                                Button {
                                    print("уменьшить")
                                } label: {
                                    Image(systemName: iconMinusCircle)
                                }
                                Button {
                                    print("current location")
                                } label: {
                                    Image(systemName: iconCurrentLocation)
                                }
                            }
                            .font(.largeTitle)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .shadow(radius: 2)
                        }
                        .padding(.trailing, 16)
                    }
                    .onAppear {
                        mapVM.checkIfLocationServicesEnabled()
                    }
                }
                if searchIsEditing {
                    List(0..<10) { _ in
                        Text("city")
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
