//
//  DetailsForCurrentWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherView: View {
    var body: some View {
        HStack(spacing: 33) {
            DescriptionWithIconView()
            HourlyCurrentWeatherView()
        }
        .frame(height: 88)
//                .border(.red, width: 2)
    }
}


struct HourlyCurrentWeatherView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hourlyCurrentWeather, id: \.self) { item in
                    VStack {
                        Text(item.hour)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .padding(.top, 8)
                        
//                            .border(.black, width: 1)
                        
                        Image(systemName: item.icon)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        // по макету не удается установить с соблюдением padding
                        // если использовать offset, то удается выровнять на глаз
                            .offset(y:-2)
                            .frame(width: 24, height: 24)
//                            .border(.red, width: 2)
                        Text(item.temp)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 12, weight: .regular))
                            .padding(.bottom, 8)
                        
                    }
//                    .border(.green, width: 2)
                }
            }
            
            
        }
        .frame(height: 88)
//        .border(.yellow, width: 2)
    }
}




struct DescriptionWithIconView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WindIconWithDescriptionView()
            PressureIconWithDescriptionView()
            HumidityIconWithDescriptionView()
        }
//        .border(.yellow, width: 2)
        //        .padding(.top, 0)
        .font(.system(size: 12, weight: .regular))
        
    }
}




struct DetailsForCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsForCurrentWeatherView()
                .previewLayout(.fixed(width: 498, height: 88))
            HeaderWeatherView()
                .previewLayout(.fixed(width: 375, height: 320))
        }
    }
}

struct WindIconWithDescriptionView: View {
    var body: some View {
        VStack {
            HStack(spacing: 9.5) {
                Image(systemName: "wind")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding(.leading, 18.25)
                    .padding(.top, 8.5)
                    .padding(.bottom, 13)
//                    .border(.red, width: 2)
                HStack {
                    Text("10")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    Text("km/h, SE")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
                    .padding(.top, 8)
                    .padding(.bottom, 12)
//                    .border(.red, width: 2)
            }
            
        }
    }
}

struct PressureIconWithDescriptionView: View {
    var body: some View {
        VStack {
            HStack(spacing: 9.5) {
                Image(systemName: "safari")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding(.leading, 17.5)
                    .padding(.bottom, 14.33)
                HStack {
                    Text("983")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    Text(" hPa")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
                .padding(.bottom, 12)
            }
//            .border(.green, width: 2)
        }
    }
}

struct HumidityIconWithDescriptionView: View {
    var body: some View {
        VStack {
            HStack(spacing: 12.5) {
                Image(systemName: "drop")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding(.leading, 20.25)
                    .padding(.bottom, 9.83)
                HStack {
                    Text("83")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    // по макету символ процента должен быть вплотную к числу
                    // ?? пробле добавляется автоматически
                    Text("%")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.74)))
                }
                .padding(.bottom, 8)
            }
            
        }
    }
}
