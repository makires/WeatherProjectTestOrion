//
//  MapViewModel.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 16.01.2022.
//

import Foundation
import CoreLocation
import MapKit
enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(
        latitude: 56.325076446859434,
        longitude: 43.93714727621532)
    static let defaultSpan = MKCoordinateSpan(
        latitudeDelta: 0.2,
        longitudeDelta: 0.2)
}

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var coordinateRegion = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan)
    @Published var annotationsMark: [Place] = []
    @Published var weatherCurrentForSheet = Weather()
    let weatherService: WeatherRepositoryProtocol
    init(weatherService: WeatherRepositoryProtocol) {
        self.weatherService = weatherService
    }
    func getCurrentWeather(for city: String, locale: String) async {
        guard let currentWeather = await weatherService.fetchCurrentWeather(for: city, locale: locale) else {
            print("не удалось получить текущую погоду для города в главнвом экране")
            return
        }
             self.weatherCurrentForSheet = Weather(response: currentWeather)

    }
    func findCity(city: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { placemarks, _ in
            if let placemarks = placemarks {
                guard let city = placemarks.first else { return }
                print(city)
                guard let coordinatePlace = city.location?.coordinate else { return }
                guard let cityName = city.name else { return }
                let place = Place(name: cityName, coordinate: coordinatePlace)
                self.annotationsMark.append(place)
                self.coordinateRegion = MKCoordinateRegion(
                    center: city.location!.coordinate,
                    span: MapDetails.defaultSpan)
            }
        }
    }
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Alert - геолокация на устройстве отключена, зайдите в настройки")
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
            print("Alert - доступ ограничен родительским контролем")
        case .denied:
            print("Alert - в доступен отказано, пройдите в настйроки")
        case .authorizedAlways, .authorizedWhenInUse:
            coordinateRegion = MKCoordinateRegion(
                center: getCurrentLocation(locationManager: locationManager),
                span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    func getCurrentLocation(locationManager: CLLocationManager) -> CLLocationCoordinate2D {
        guard let currentLocation = locationManager.location?.coordinate else { return MapDetails.startingLocation}
        return currentLocation
    }
    func searchQuery() {
        print("запрос")
    }
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        guard let newCurrentLocation = locations.first?.coordinate else {
    //            print("не удалось получить новую текущую позицию пользователя")
    //            return }
    //        coordinateRegion = MKCoordinateRegion(center: newCurrentLocation, span: MapDetails.defaultSpan)
    //        }
}
