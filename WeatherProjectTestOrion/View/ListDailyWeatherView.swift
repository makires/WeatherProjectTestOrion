//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI



struct ListDailyWeatherView: View {
    var body: some View {
        List(listDaily, id:\.self) { item in
            RowForListDailyWeather(dailyWeather: item)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

struct RowForListDailyWeather: View {
    let dailyWeather: DayWeather
    
    var body: some View {
        HStack {
            DateAndNameDayForDailyWeatherView(dailyWeather: dailyWeather)
            Spacer()
            HStack(spacing: 10) {
                Image(systemName: dailyWeather.icon)
                    .foregroundColor(dailyWeather.colorIcon)
                    .frame(width: 44, height: 44)
//                    .border(.red, width: 2)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                HStack(spacing: 4) {
                    Temp1ForDailyWeather(dailyWeather: dailyWeather)
                    Temp2ForDailyWeather(dailyWeather: dailyWeather)
                }
                .frame(width: 100)
//                .border(.red, width: 2)
            }
            .frame(width: 154)
            .padding(.trailing, 16)
//            .border(.black, width: 2)
        }
        
        
    }
}

struct DateAndNameDayForDailyWeatherView: View {
    let dailyWeather: DayWeather
    var body: some View {
        VStack(alignment: .leading) {
            Text(dailyWeather.date)
                .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
//                .border(.red, width: 2)
                .padding(.leading, 16)
                .padding(.top, 12)
            Text(dailyWeather.nameDay)
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
//                .border(.red, width: 2)
                .padding(.leading, 16)
                .padding(.bottom, 12)
        }
//        .border(.red, width: 2)
    }
}

struct Temp2ForDailyWeather: View {
    let dailyWeather: DayWeather
    var body: some View {
        VStack {
            Text(dailyWeather.temp2)
                .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                .tracking(-0.32)
                .allowsTightening(true)
//                .multilineTextAlignment(.trailing)
//                .border(.red, width: 2)
            // NOTE!
//          =================================
            // padding по макету ломает макет
            // если закомментировать , то визуально совпадает с макетом
//                .padding(.leading, 16)
//                .padding(.trailing, 0)
//                .padding(.top, 12)
//                .padding(.bottom, 11)
            // ==============================
                .font(.system(size: 16, weight: .regular))
        }
        .frame(width: 44, height: 44)
//        .border(.green, width: 2)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .padding(.trailing, 0)
    }
}

struct Temp1ForDailyWeather: View {
    let dailyWeather: DayWeather
    var body: some View {
        VStack {
            Text(dailyWeather.temp1)
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                
                .font(.system(size: 22, weight: .regular))
                .tracking(0.35)
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 0))
                .allowsTightening(true)
        }
        .frame(width: 52, height: 44)
//        .border(.green, width: 2)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}


struct ListDailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ListDailyWeatherView()
    }
}
