//
//  FlightSearchView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct FlightSearchView: View {
    @State private var selectedFlightType = 0
    @State private var selectedDepartureAirport: Airport? = nil
    @State private var selectedArrivalAirport: Airport? = nil
    @State private var isSelectingDepartureAirport: Bool = false
    @State private var isSelectingArrivalAirport: Bool = false
    
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
                Button(action: {
                    isSelectingDepartureAirport = true
                }) {
                    Label(selectedDepartureAirport != nil ? selectedDepartureAirport!.iataCode : "From", systemImage: "airplane.departure")
                        .foregroundColor(selectedDepartureAirport != nil ? .blue : .black)
                }
                Button(action: {
                    isSelectingArrivalAirport = true
                }) {
                    Label(selectedArrivalAirport != nil ? selectedArrivalAirport!.iataCode : "To", systemImage: "airplane.arrival")
                        .foregroundColor(selectedArrivalAirport != nil ? .blue : .black)
                }
            }
        }
        .sheet(isPresented: $isSelectingDepartureAirport) {
            AirportSelectionView(selectedAirport: $selectedDepartureAirport)
        }
        .sheet(isPresented: $isSelectingArrivalAirport) {
            AirportSelectionView(selectedAirport: $selectedArrivalAirport)
        }
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
