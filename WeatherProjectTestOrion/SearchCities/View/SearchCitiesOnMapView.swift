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
            HStack(alignment: .center) {
                Image(systemName: "magnifyingglass")
                TextField(Localization.search.localized, text: $searchTextFeild)
            }
            .padding(.leading, 4)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor((Color(red: 0.46, green: 0.46, blue: 0.50, opacity: 0.12))))
            .padding(.horizontal, 16)
            ZStack(alignment: .trailing) {
                Map(coordinateRegion: $coordinateRegion)
                    .ignoresSafeArea(edges: .bottom)
                VStack(spacing: 4) {
                    Group {
                        Button {
                            print("увеличить")
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        Button {
                            print("уменьшить")
                        } label: {
                            Image(systemName: "minus.circle.fill")
                        }
                        Button {
                            print("текущая геопозиция")
                        } label: {
                            Image(systemName: "paperplane.circle.fill")
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
    }
}

struct SearchCitiesOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCitiesOnMapView()
    }
}
