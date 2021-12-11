//
//  CityTitleView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CityTitleView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Nizhny Novgorod")
                    .font(.largeTitle)
                    .lineSpacing(41)
            }
            .border(.red, width: 2)
            .padding(.leading, 16)
            .padding(.top, 39)
            .padding(.bottom, 8)
            Spacer()
            VStack {
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "list.bullet")
                        .font(.title2)
                })
                    .frame(width: 44, height: 44)
            }
            .padding(.top, 44)
            .padding(.trailing, 10)
            .padding(.bottom, 0)
            
        }
        
        .border(.red, width: 2)
        .frame(width: 375, height: 88)
        
//        HStack(alignment: .bottom, spacing: 18) {
//            Text("Nizhny Novgorod")
//                .font(.largeTitle)
//                .frame(width: 287, alignment: .topLeading)
//                .lineSpacing(41)
//
//            Text("􀋲")
//                .font(.body)
//                .multilineTextAlignment(.center)
//                .frame(width: 44, height: 44)
//                .lineSpacing(22)
//                .frame(width: 44, height: 44)
//        }
//        .padding(.leading, 16)
//        .padding(.trailing, 10)
//        .padding(.top, 39)
//        .frame(width: 375, height: 88)
    }
}

struct CityTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CityTitleView()
                .previewLayout(.fixed(width: 375, height: 88))
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
            
        }
    }
}
