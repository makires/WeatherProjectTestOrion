//
//  RequestNetwork.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 17.12.2021.
//

import Foundation
import Alamofire

func testRequest() {
    print(testUrl)
    let request = AF.request(testUrl)
    request.responseDecodable(of: Weather.self) { response in
        guard let weather = response.value else { return }
        print(weather.current.temperature)
    }
}
