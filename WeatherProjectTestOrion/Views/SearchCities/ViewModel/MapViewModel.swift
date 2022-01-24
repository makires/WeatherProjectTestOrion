//
//  MapViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 16.01.2022.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

@MainActor class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    let weatherService: WeatherRepositoryCoordinatesProtocol
    @Published var showAlertData: AlertData?
    @Published var showAlert = false
    @Published var coordinateRegion = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan)
    @Published var annotationsMark: [Place] = []
    @Published var coordinatesCityForNetwork = ""
    @Published var nameCityForSheet = ""
    @Published var weatherCurrentForSheet = Weather()
    @Environment(\.locale) var locale

    init(weatherService: WeatherRepositoryCoordinatesProtocol) {
        self.weatherService = weatherService
    }

    func getCurrentWeatherBy(coordinates: String, locale: String) async {
        guard let currentWeatherWithCoordinates =
                await weatherService.fetchCurrentWeatherByCoordinates(for: coordinates,
                                                                         locale: locale) else { return }
        self.weatherCurrentForSheet = Weather(response: currentWeatherWithCoordinates)
    }

    func converterCoordinates(coordinate: CLLocationCoordinate2D) -> String {
        let latitude = String(coordinate.latitude)
        let longitude = String(coordinate.longitude)
        return "\(latitude),\(longitude)"
    }

    func findCity(cityName: String) async {
        let geocoder = CLGeocoder()
        do {
            let placemarks = try await geocoder.geocodeAddressString(cityName)
            guard let city = placemarks.first,
                  let coordinatePlace = city.location?.coordinate,
                  let cityName = city.name else { return }
            self.nameCityForSheet = cityName
            let place = Place(name: cityName, coordinate: coordinatePlace)
            self.annotationsMark.append(place)
            self.coordinateRegion = MKCoordinateRegion(
                center: city.location!.coordinate,
                span: MapDetails.defaultSpan)
            self.coordinatesCityForNetwork = self.converterCoordinates(coordinate: place.coordinate)
        } catch {
            self.showAlert = true
            self.showAlertData = AlertData(title: Localization.geocoderError.localized + error.localizedDescription)
        }
        await getCurrentWeatherBy(coordinates: coordinatesCityForNetwork, locale: locale.identifier)
    }

    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            self.showAlert = true
            self.showAlertData = AlertData(title: Localization.locationOff.localized)
        }
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.showAlert = true
            self.showAlertData = AlertData(
                title:
                    Localization.errorRestricted.localized)
        case .denied:
            self.showAlert = true
            self.showAlertData = AlertData(title: Localization.errorDenied.localized)
        case .authorizedAlways, .authorizedWhenInUse:
            coordinateRegion = MKCoordinateRegion(
                center: getCurrentLocationForAuthorization(locationManager: locationManager),
                span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    func getCurrentLocationForAuthorization(locationManager: CLLocationManager) -> CLLocationCoordinate2D {
        guard let currentLocation = locationManager.location?.coordinate else { return MapDetails.startingLocation}
        return currentLocation
    }

    func requestCurrentLocation() {
        guard let locationManager = locationManager else {
            return
        }
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: MapDetails.defaultSpan)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
