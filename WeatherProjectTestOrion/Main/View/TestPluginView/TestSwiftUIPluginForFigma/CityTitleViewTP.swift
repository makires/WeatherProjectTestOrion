//
//  TestPluginView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 12.12.2021.
//

import SwiftUI

struct CityTitleViewTP: View {
    var body: some View {
        Text("Nizhny Novgorod")
            .font(.system(size: 34, weight: .regular))

            .tracking(0.37)
    }
}

struct TestPluginView_Previews: PreviewProvider {
    static var previews: some View {
        CityTitleViewTP()
    }
}
