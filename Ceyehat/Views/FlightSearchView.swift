//
//  FlightSearchView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct FlightSearchView: View {
    @State private var selectedFlightType = 0
    
    let flightTypes = ["One way", "Round trip", "Multi-city"]
    
    var body: some View {
        List {
            Section(header: Text("Flight Type")){
                Picker(selection: $selectedFlightType, label: Text("")) {
                    ForEach(0..<3){
                        Text(self.flightTypes[$0]).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Where would you like to go?")) {
                NavigationLink(destination: AirportSelectionView()) {
                    Label("From", systemImage: "airplane.departure")
                }
                NavigationLink(destination: AirportSelectionView()) {
                    Label("To", systemImage: "airplane.arrival")
                }
            }
        }
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
