//
//  HourlyCurrentWeather.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 11.12.2021.
//

import Foundation

struct HourlyWeather: Hashable {
    let hour: String
    let icon: String
    let temp: String
}

let hourlyCurrentWeather = [
    HourlyWeather(hour: "Now", icon: "cloud", temp: "+16º"),
    HourlyWeather(hour: "18:00", icon: "cloud", temp: "+17º"),
    HourlyWeather(hour: "19:00", icon: "cloud", temp: "+16º"),
    HourlyWeather(hour: "20:00", icon: "cloud", temp: "+16º"),
    HourlyWeather(hour: "21:00", icon: "cloud", temp: "+15º"),
    HourlyWeather(hour: "22:00", icon: "cloud", temp: "+16º"),
    HourlyWeather(hour: "23:00", icon: "cloud", temp: "+16º"),
    HourlyWeather(hour: "00:00", icon: "cloud", temp: "+16º"),
]
