//
//  FlightPriceView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 19.03.2023.
//

import SwiftUI

struct FlightPriceView: View {
    let flight: Flight
    @Binding var showFlightPriceSheet: Bool
    @Binding var selectedFlight: Flight?
    @Binding var selectedPrice: Double?
    @ObservedObject var viewModel: SeatViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showFlightPriceSheet = false
                    selectedFlight = nil
                }) {
                    Text("Seç")
                        .fontWeight(.bold)
                }
                .padding(.trailing)
            }
            .padding(.top)
            .background(Color.white)
            Spacer()
            VStack {
                List {
                    Section(header: Text("Uçuş Numarası")) {
                        Text(selectedFlight?.flightNumber ?? "TK01")
                    }
                    Section(header: Text("Havayolu")) {
                        Text(selectedFlight?.airlineName ?? "THY")
                    }
                    Section(header: Text("Uçak Tipi")) {
                        Text(selectedFlight?.aircraftName ?? "B")
                    }
                    Section(header: Text("Kalkış - Varış")) {
                        HStack {
                            Text("\(dateFormatter.string(from: flight.departureHour))")
                            RoundedRectangle(cornerRadius: 8)
                                .frame(maxHeight: 25)
                                .foregroundColor(.white)
                                .overlay(Text(durationFormatterFull.string(from: flight.arrivalHour.timeIntervalSince(flight.departureHour)) ?? ""))
                            Text("\(dateFormatter.string(from: flight.arrivalHour))")
                        }
                    }
                }
                .listStyle(InsetListStyle())
                .bold()
                .padding()
            }
            Button(action: {
                selectedFlight = flight
                selectedPrice = flight.economyPrice
                showFlightPriceSheet = false
                viewModel.selectedSeatType = .economy
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.indigo)
                    .frame(maxHeight: 40)
                    .overlay(
                        HStack {
                            Text("TRY \(flight.economyPrice, specifier: "%.2f") - Economy")
                                .foregroundColor(.white)
                        })
                    .padding()
            }
            Button(action: {
                selectedFlight = flight
                selectedPrice = flight.comfortPrice
                showFlightPriceSheet = false
                viewModel.selectedSeatType = .comfort
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.cyan)
                    .frame(maxHeight: 40)
                    .overlay(
                        HStack {
                            Text("TRY \(flight.comfortPrice, specifier: "%.2f") - Comfort")
                                .foregroundColor(.white)
                        })
                    .padding()
            }
            Button(action: {
                selectedFlight = flight
                selectedPrice = flight.businessPrice
                showFlightPriceSheet = false
                viewModel.selectedSeatType = .business
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.teal)
                    .frame(maxHeight: 40)
                    .overlay(
                        HStack {
                            Text("TRY \(flight.businessPrice, specifier: "%.2f") - Business")
                                .foregroundColor(.white)
                        })
                    .padding()
            }
            Spacer()
        }
    }
}

struct FlightPriceView_Previews: PreviewProvider {
    @State static var showFlightPriceSheet = false
    @State static var selectedFlight: Flight?
    @State static var selectedPrice: Double?
    private static var viewModel = SeatViewModel()
    
    static let sampleFlight = Flight(
        flightNumber: "AB123",
        airlineName: "Air Berlin",
        aircraftName: "Boeing 737",
        departureHour: Date(),
        arrivalHour: Date().addingTimeInterval(3600),
        economyPrice: 400.0,
        comfortPrice: 700.0,
        businessPrice: 1200.0
    )
    
    static var previews: some View {
        FlightPriceView(flight: sampleFlight, showFlightPriceSheet: $showFlightPriceSheet, selectedFlight: $selectedFlight, selectedPrice: $selectedPrice, viewModel: viewModel)
    }
}
