//
//  SearchCitiesOnMapView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import SwiftUI
import MapKit
struct SearchCitiesOnMapView: View {
    @State var searchTextFeild = ""
    @State var searchIsEditing = false
    @Environment(\.presentationMode) var presentationMode
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 56.325076446859434,
            longitude: 43.93714727621532),
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
            longitudeDelta: 0.2))
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
                        Map(coordinateRegion: $coordinateRegion)
                            .ignoresSafeArea(edges: .bottom)
                            .searchable(text: $searchTextFeild)
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
                                    print("текущая геопозиция")
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
                }
                if searchIsEditing {
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
