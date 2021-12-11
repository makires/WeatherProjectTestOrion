//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct ListDailyWeatherView: View {
    var body: some View {
        List(0..<10) { item in
            RowForListDailyWeather()
        }
        .listStyle(PlainListStyle())
    }
}

struct ListDailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ListDailyWeatherView()
    }
}

struct RowForListDailyWeather: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("6 May")
                Text("Monday")
            }
            VStack {
                Text("Icon")
            }
            VStack {
                Text("+18")
            }
            VStack {
                Text("+19")
            }
        }
    }
}
