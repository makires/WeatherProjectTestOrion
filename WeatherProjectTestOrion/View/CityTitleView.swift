//
//  CityTitleView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CityTitleView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 18) {
            Text("Nizhny Novgorod")
                .font(.largeTitle)
                .frame(width: 287, alignment: .topLeading)
                .lineSpacing(41)
            
            Text("􀋲")
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(width: 44, height: 44)
                .lineSpacing(22)
                .frame(width: 44, height: 44)
        }
        .padding(.leading, 16)
        .padding(.trailing, 10)
        .padding(.top, 39)
        .frame(width: 375, height: 88)
    }
}

struct CityTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CityTitleView()
            .previewLayout(.fixed(width: 375, height: 88))
    }
}
