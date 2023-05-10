//
//  MapView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 9.05.2023.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}
