//
//  WeatherProjectTestOrionApp.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 10.12.2021.
//

import SwiftUI

@main
struct WeatherProjectTestOrionApp: App {
    var body: some Scene {
        WindowGroup {
            ViewFactory.makeView(typeView: .main)
        }
    }
}
