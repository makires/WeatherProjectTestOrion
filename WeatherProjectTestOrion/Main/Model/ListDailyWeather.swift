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
    DayWeather(
        date: "6 May", nameDay: "Today", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+10°", temp2: "+8°"),
    DayWeather(
        date: "7 May", nameDay: "Tomorrow", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+21°", temp2: "+18°"),
    DayWeather(
        date: "8 May", nameDay: "Friday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+19°", temp2: "+15°"),
    DayWeather(
        date: "9 May", nameDay: "Saturday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+17°", temp2: "+13°"),
    DayWeather(
        date: "10 May", nameDay: "Sunday", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+16°", temp2: "+14°"),
    DayWeather(
        date: "11 May", nameDay: "Monday", icon: "sun.max.fill", colorIcon: .yellow, temp1: "+21°", temp2: "+20°"),
    DayWeather(
        date: "12 May", nameDay: "Tuesday", icon: "cloud.rain.fill", colorIcon: .blue, temp1: "+19°", temp2: "+14°"),
    DayWeather(
        date: "13 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "14 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "15 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "16 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "17 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "18 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "19 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "20 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°"),
    DayWeather(
        date: "21 May", nameDay: "Wednesday", icon: "cloud.bolt.fill", colorIcon: .blue, temp1: "+12°", temp2: "+8°")
]
