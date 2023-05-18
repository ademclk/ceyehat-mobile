//
//  FlightSearchView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct FlightSearchView: View {
    @State private var selectedFlightType: FlightType = .oneWay
    @State private var selectedDepartureAirport: Airport? = nil
    @State private var selectedArrivalAirport: Airport? = nil
    @State private var departureDate = Date()
    @State private var returnDate = Date()
    @State private var passengerCount: Int = 1
    @State private var isSelectingDepartureAirport: Bool = false
    @State private var isSelectingArrivalAirport: Bool = false

    
    let flightListViewModel = FlightViewModel()
    
    var body: some View {
        Form {
            FlightTypePicker(selection: $selectedFlightType)
                .padding(.bottom)
            
            FlightAirportPicker(departure: $selectedDepartureAirport, arrival: $selectedArrivalAirport, isSelectingDeparture: $isSelectingDepartureAirport, isSelectingArrival: $isSelectingArrivalAirport, flightType: $selectedFlightType)
            
            CombinedDatePicker(departureDate: $departureDate, returnDate: $returnDate, flightType: $selectedFlightType)
            
            PassengerCountView(totalPassengerCount: $passengerCount)
            
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

