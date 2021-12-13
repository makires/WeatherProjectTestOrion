//
//  ListDailyWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 12.12.2021.
//

import Foundation
import SwiftUI
struct DayWeather: Hashable {
    let date: String
    let nameDay: String
    let icon: String
    let colorIcon: Color
    let temp1: String
    let temp2: String
}

let listDaily = [
    DayWeather(date: "6 May", nameDay: "Today", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+10º", temp2: "+8º"),

DayWeather(date: "7 May", nameDay: "Tomorrow", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+21º", temp2: "+18º"),

DayWeather(date: "8 May", nameDay: "Friday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+19º", temp2: "+15º"),

DayWeather(date: "9 May", nameDay: "Saturday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+17º", temp2: "+13º"),

    DayWeather(date: "10 May", nameDay: "Sunday", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+16º", temp2: "+14º"),

DayWeather(date: "11 May", nameDay: "Monday", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+21º", temp2: "+20º"),

DayWeather(date: "12 May", nameDay: "Tuesday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+19º", temp2: "+14º"),

DayWeather(date: "13 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12º", temp2: "+8º"),
DayWeather(date: "13 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12º", temp2: "+8º")

]
