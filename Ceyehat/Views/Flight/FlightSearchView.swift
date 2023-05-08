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
    @State private var departureDate = Date()
    @State private var returnDate = Date()
    @State private var passengerCount: Int = 1
    
    let flightListViewModel = FlightViewModel()
    
    let flightTypes = ["Tek Yön", "Gidiş Dönüş", "Çoklu Uçuş"]
    
    var body: some View {
        VStack {
            List {
                Section(){
                    Picker(selection: $selectedFlightType, label: Text("")) {
                        ForEach(0..<3){
                            Text(self.flightTypes[$0]).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section() {
                    Button(action: {
                        isSelectingDepartureAirport = true
                    }) {
                        Label(selectedDepartureAirport != nil ? "\(selectedDepartureAirport!.cityName), \(selectedDepartureAirport!.countryName) - \(selectedDepartureAirport!.iataCode)" : "Nereden", systemImage: "airplane.departure")
                            .foregroundColor(selectedDepartureAirport != nil ? .blue : .none)
                        
                    }
                    Button(action: {
                        isSelectingArrivalAirport = true
                    }) {
                        Label(selectedArrivalAirport != nil ?
                              "\(selectedArrivalAirport!.cityName), \(selectedArrivalAirport!.countryName) - \(selectedArrivalAirport!.iataCode)": "Nereye", systemImage: "airplane.arrival")
                        .foregroundColor(selectedArrivalAirport != nil ? .blue : .none)
                    }
                }
                if selectedFlightType == 0 || selectedFlightType == 1 {
                    Section() {
                        DatePicker("Gidiş Tarihi", selection: $departureDate, in: Date()..., displayedComponents: [.date])
                            .datePickerStyle(CompactDatePickerStyle())
                            .environment(\.locale, Locale(identifier: "tr_TR"))
                        
                        if selectedFlightType == 1 {
                            DatePicker("Dönüş Tarihi", selection: $returnDate, in: departureDate...,
                                       displayedComponents: [.date])
                            .datePickerStyle(CompactDatePickerStyle())
                            .environment(\.locale, Locale(identifier: "tr_TR"))
                        }
                    }
                    Section() {
                        Stepper(value: $passengerCount, in: 1...10) {
                            HStack {
                                Text("Yolcu Sayısı: \(passengerCount)")
                                Image(systemName: "figure.stand")
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $isSelectingDepartureAirport) {
                NavigationView {
                    VStack {
                        AirportSelectionView(selectedAirport: $selectedDepartureAirport)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("İptal") {
                                        isSelectingDepartureAirport = false
                                        selectedDepartureAirport = nil
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Kalkış Havalimanı Seç") {
                                        isSelectingDepartureAirport = false
                                    }
                                }
                            }
                    }
                }
            }
            .sheet(isPresented: $isSelectingArrivalAirport) {
                NavigationView {
                    VStack {
                        AirportSelectionView(selectedAirport: $selectedArrivalAirport)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("İptal") {
                                        isSelectingArrivalAirport = false
                                        selectedArrivalAirport = nil
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Varış Havalimanı Seç") {
                                        isSelectingArrivalAirport = false
                                    }
                                }
                            }
                    }
                }
            }
            NavigationLink(destination: FlightListView(
                viewModel: flightListViewModel,
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
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
