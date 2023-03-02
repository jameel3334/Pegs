//
//  LocationManager.swift
//  Pegs
//
//  Created by Mohammed Jameeluddin on 3/2/23.
//

import SwiftUI
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private var lastLocation: CLLocation?
    var onLocationUpdate: ((CLLocation) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getUserLocation(completion: @escaping (CLLocationCoordinate2D) -> Void) {
        if let lastLocation = lastLocation {
            completion(lastLocation.coordinate)
        } else {
            onLocationUpdate = { location in
                completion(location.coordinate)
            }
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        onLocationUpdate?(location)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
