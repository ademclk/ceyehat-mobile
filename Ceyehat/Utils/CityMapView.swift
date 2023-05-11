//
//  CityMapView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 10.05.2023.
//

import Foundation
import SwiftUI
import MapKit

struct CityMapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: CityMapView
        
        init(_ parent: CityMapView) {
            self.parent = parent
        }
    }
}


struct CityMapModalView: View {
    let city: FeaturedCity?
    @Binding var showingCityMap: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showingCityMap = false
                }
            
            if let coordinate = city?.coordinate {
                MapView(coordinate: coordinate)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

