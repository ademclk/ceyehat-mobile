//
//  FlightSearchView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct FlightSearchView: View {
    @EnvironmentObject var userAuth: UserAuth
    @State private var selectedFlightType: FlightType = .oneWay
    @State private var selectedDepartureAirport: Airport? = nil
    @State private var selectedArrivalAirport: Airport? = nil
    @State private var departureDate = Date()
    @State private var returnDate = Date()
    @State private var passengerCount: Int = 1
    @State private var isSelectingDepartureAirport: Bool = false
    @State private var isSelectingArrivalAirport: Bool = false
    
    @ObservedObject var flightViewModel = FlightViewModel()
    @State private var navigateToFlightList: Bool = false
    
    var body: some View {
        Form {
            FlightTypePicker(selection: $selectedFlightType)
                .padding(.bottom)
            
            FlightAirportPicker(departure: $selectedDepartureAirport, arrival: $selectedArrivalAirport, isSelectingDeparture: $isSelectingDepartureAirport, isSelectingArrival: $isSelectingArrivalAirport, flightType: $selectedFlightType)
            

            CombinedDatePicker(departureDate: $departureDate, returnDate: $returnDate, flightType: $selectedFlightType)
            
            PassengerCountView(totalPassengerCount: $passengerCount)
            
            NavigationLink(destination: FlightListView(
                viewModel: flightViewModel,
                depDate: $departureDate,
                passengerCount: $passengerCount,
                depAirportIataCode: selectedDepartureAirport?.iataCode ?? "Dep",
                arrAirportIataCode: selectedArrivalAirport?.iataCode ?? "Arr",
                retDate: returnDate)) {
                    Text("Uçuş Ara")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .navigationTitle("Uçuş Ara")
                .padding()
            
        }
        .sheet(isPresented: $isSelectingDepartureAirport) {
            AirportSelectionView(selectedAirport: $selectedDepartureAirport)
        }
        .sheet(isPresented: $isSelectingArrivalAirport) {
            AirportSelectionView(selectedAirport: $selectedArrivalAirport)
        }
    }
    
    func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}



struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}

