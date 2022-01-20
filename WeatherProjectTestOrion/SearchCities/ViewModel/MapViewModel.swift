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
enum MapDetails {
  static let startingLocation = CLLocationCoordinate2D(
    latitude: 56.325076446859434,
    longitude: 43.93714727621532)
  static var defaultSpan = MKCoordinateSpan(
    latitudeDelta: 0.2,
    longitudeDelta: 0.2)
}

@MainActor class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
  var locationManager: CLLocationManager?
  @Published var coordinateRegion = MKCoordinateRegion(
    center: MapDetails.startingLocation,
    span: MapDetails.defaultSpan)
  @Published var annotationsMark: [Place] = []
  @Published var coordinatesCityForNetwork = ""
  @Published var nameCityForSheet = ""
  @Published var weatherCurrentForSheet = Weather()
  @Environment(\.locale) var locale
  let weatherService: WeatherRepositoryCoordinatesProtocol
  init(weatherService: WeatherRepositoryCoordinatesProtocol) {
    self.weatherService = weatherService
  }
  func zoomUp() {
    print("zoom up")
  }
  func zoomDown() {
    print("zoom down")

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
      guard let city = placemarks.first else { return }
      guard let coordinatePlace = city.location?.coordinate else { return }
      guard let cityName = city.name else { return }
      self.nameCityForSheet = cityName
      let place = Place(name: cityName, coordinate: coordinatePlace)
      self.annotationsMark.append(place)
      self.coordinateRegion = MKCoordinateRegion(
        center: city.location!.coordinate,
        span: MapDetails.defaultSpan)
      self.coordinatesCityForNetwork = self.converterCoordinates(coordinate: place.coordinate)
    } catch {
      print("ошибка в асинхронном геокодере", error)
    }
    await getCurrentWeatherBy(coordinates: coordinatesCityForNetwork, locale: locale.identifier)
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
    print("запрашиваем геопозицю")
    locationManager.requestLocation()
  }
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print("делегат-метод обновления позиции")
    if let location = locations.first {
      print("текущая геопозиция", location)
      coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: MapDetails.defaultSpan)
    }
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Ошибка - Failed to find user's location", error.localizedDescription)
  }
}
