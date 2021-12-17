//
//  API.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire

let key = "124162da7979b3110f81ce570e2aa074"
let daseUrl = "http://api.weatherstack.com/"

let city = "New York"

let currentWeatherUrl = "http://api.weatherstack.com/current?access_key=\(key)&query=\(city)"

let otherUrl = "https://httpbin.org/get"

func testRequest() {
    AF.request(currentWeatherUrl).response { response in
        debugPrint(response)
    }
}

