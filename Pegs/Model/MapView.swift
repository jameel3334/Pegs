//
//  MapView.swift
//  Pegs
//
//  Created by Mohammed Jameeluddin on 3/2/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var userLocation: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let region = MKCoordinateRegion(
            center: userLocation,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        view.setRegion(region, animated: true)
    }
}
