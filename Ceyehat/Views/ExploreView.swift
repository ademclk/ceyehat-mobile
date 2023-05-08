//
//  ExploreView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    var body: some View {
        NavigationView {
            ZStack {
                MapView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Keşfet")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
