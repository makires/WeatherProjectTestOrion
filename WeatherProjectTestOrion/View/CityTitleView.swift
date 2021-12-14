//
//  CityTitleView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct CityTitleView: View {
    var body: some View {
        GeometryReader { gr in
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Nizhny Novgorod")
                        
                        .font(.largeTitle)
                        .lineSpacing(41)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
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
                            .font(.body)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    })
                    
                        .frame(width: 44, height: 44)
                }
                .border(.red, width: 2)
                .padding(.top, 44)
                .padding(.trailing, 10)
                .padding(.bottom, 0)
                
            }
            .border(.red, width: 2)
//            .edgesIgnoringSafeArea(.horizontal)
            .frame(width: gr.size.width, height: 88)
        }
        
        
    }
}

struct CityTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CityTitleView()
                .previewLayout(.fixed(width: 375, height: 88))
                .background(Color.gray)
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
            
        }
    }
}
