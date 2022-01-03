//
//  Cities.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 29.12.2021.
//

import Foundation

struct CitiesListDataStorage: Codable {
    var cities: [String] = []
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    static func decode(citiesListData: Data) -> CitiesListDataStorage? {
        let decoder = JSONDecoder()
        if let cities = try? decoder.decode(CitiesListDataStorage.self, from: citiesListData) {
            return cities
        } else {
            return nil
        }
    }
}
