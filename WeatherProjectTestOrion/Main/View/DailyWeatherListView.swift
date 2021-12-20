//
//  ListDailyWeatherView.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct DailyWeatherListView: View {
    @State var height: CGFloat = .zero
    
    var body: some View {
//        GeometryReader { geoProxyList in
            ScrollView {
                Color.clear
                    .background(
                        GeometryReader { geometryProxy in
                            Color.clear
                                .preference(key: OffsetPreferenceKey.self, value: geometryProxy.frame(in: .global).minY)
                                .onAppear {
                                    height = geometryProxy.frame(in: .global).minY
                                    print("координата Clear into ScrollView в глобал = \(height)")
                                }
                        })
                    ForEach(listDaily, id:\.self) { item in
                        DailyWeatherRow(dailyWeather: item)
                        Divider()
                            .padding(0)
                    }
                    .listRowInsets(EdgeInsets())
                    
                }
            .onPreferenceChange(OffsetPreferenceKey.self) { newY in
                        print("The new child frame Y is: \(newY)")
                    }
            .coordinateSpace(name: "Scroll")
                .border(.red, width: 2)
    //            .frame(height: geoProxyList.frame(in: .global).size.height+145)
    //            .offset(y: -145)
                .listStyle(.plain)
                .onAppear {
    //                print("высота List = \(geoProxyList.frame(in: .global).size.height)")
            }
//        }
     
//
//        .onPreferenceChange(FrameOriginYPreferenceKey.self) { newSize in
//            print("The new child frame Y is: \(newSize)")
//        }
//        GeometryReader { proxyOutside in
//            ScrollView {
//                ForEach(listDaily, id: \.self) { item in
//                    DailyWeatherRow(dailyWeather: item)
//                    Divider()
//                        .padding(0)
//                }
//                .background(
//                    GeometryReader { proxyInside in
//                        Color.yellow
//                            .preference(key: OffsetPreferenceKey.self, value: proxyInside.frame(in: .local).size.height)
//
//
//                    }
//                )
//            }
//            .onAppear(perform: {
//                height = proxyOutside.frame(in: .local).size.height
//                print(height)
//            })
////            .onPreferenceChange(OffsetPreferenceKey.self, perform: { <#Equatable#> in
////                <#code#>
////            })
//            .coordinateSpace(name: "frameLayer")
//        }
        
        
        
        // ===============================================================
        /*
        List {
            ForEach(listDaily, id:\.self) { item in
                DailyWeatherRow(dailyWeather: item)
            }
            .listRowInsets(EdgeInsets())
            .background(
                GeometryReader { geometryProxy in
                    Color.clear
                        .preference(key: FrameOriginYPreferenceKey.self, value: geometryProxy.frame(in: .global).origin.y)
                })
        }
        .listStyle(.plain)
        
        .onPreferenceChange(FrameOriginYPreferenceKey.self) { newSize in
            print("The new child frame Y is: \(newSize)")
        }
         */
        // ===============================================================
        // как List разместить в ScrollView
        ////        GeometryReader { g in
        //        ScrollView {
        ////            List {
        //                    ForEach(listDaily, id:\.self) { item in
        //                        DailyWeatherRow(dailyWeather: item)
        //                        Divider()
        ////                    }
        ////                    .listRowInsets(EdgeInsets())
        //
        //                    // попробовать через жест?
        //            }        .listStyle(.plain)
        ////                .frame(width: g.size.width-0, height: g.size.height-0)
        //        }
        ////    }
        //
    }
}

struct DailyWeatherRow: View {
    let dailyWeather: DayWeather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dailyWeather.date)
                    .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                Text(dailyWeather.nameDay)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            }
            Spacer()
            
            let gridItems = [GridItem(spacing: 10), GridItem( spacing: 4), GridItem(alignment: .trailing)]
            
            HStack {
                LazyVGrid(columns: gridItems) {
                    Image(systemName: dailyWeather.icon)
                        .foregroundColor(dailyWeather.colorIcon)
                    Text(dailyWeather.temp1)
                        .tracking(0.35)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .font(.system(size: 22, weight: .regular))
                    Text(dailyWeather.temp2)
                        .foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.6)))
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}


struct DailyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailyWeatherListView()
            MainView()
        }
    }
}
