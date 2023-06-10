//
//  FlightListView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 16.03.2023.
//

import SwiftUI

struct FlightListView: View {
    @StateObject var viewModel: FlightViewModel
    @Binding var depDate: Date
    @Binding var passengerCount: Int
    var depAirportIataCode: String
    var arrAirportIataCode: String
    var retDate: Date?
    
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else if viewModel.flights.isEmpty {
                    EmptyStateView()
                } else {
                    FlightList(flights: viewModel.flights, viewModel: viewModel)
                }
                
                BottomBar(viewModel: viewModel, passengerCount: $passengerCount, selectedFlight: $viewModel.selectedFlight, selectedPrice: $viewModel.selectedPrice)
            }
            .navigationTitle("Uçuşlar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    DatePicker("", selection: $depDate, in: Date()...Date().addingTimeInterval(30*24*60*60), displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .environment(\.locale, Locale(identifier: "tr_TR"))
                        .onChange(of: depDate) { newValue in
                            depDate = newValue
                            viewModel.searchFlights(departureAirportIataCode: depAirportIataCode, arrivalAirportIataCode: arrAirportIataCode, departureDate: newValue, returnDate: retDate, passengerCount: passengerCount)
                        }
                }
            }
            .sheet(isPresented: $viewModel.showFlightPriceSheet) {
                if let flight = viewModel.selectedFlight {
                    FlightPriceView(flight: flight, showFlightPriceSheet: $viewModel.showFlightPriceSheet, selectedFlight: $viewModel.selectedFlight, selectedPrice: $viewModel.selectedPrice, viewModel: viewModel.seatViewModel)
                }
            }
            .onAppear {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    viewModel.searchFlights(departureAirportIataCode: depAirportIataCode, arrivalAirportIataCode: arrAirportIataCode, departureDate: depDate, returnDate: retDate, passengerCount: passengerCount)
                    isLoading = false
                }
            }
        }
    }
    
    struct EmptyStateView: View {
        var body: some View {
            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
                Text("Seçilen tarih ve güzergahta uçuş bulunamadı veya tüm uçuşlar dolu. Farklı bilgilerle yeniden arama yapabilirsiniz.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    struct FlightList: View {
        var flights: [Flight]
        var viewModel: FlightViewModel
        
        var body: some View {
            List(flights, id: \.flightNumber) { flight in
                FlightRow(flight: flight)
                    .onTapGesture {
                        viewModel.selectFlight(flight)
                        viewModel.showFlightPriceSheet = true
                    }
            }
        }
    }
    
    struct FlightRow: View {
        var flight: Flight
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(flight.flightNumber) - \(flight.airlineName)")
                    .font(.headline)
                FlightInfoRow(flight: flight)
                PriceTag(price: flight.economyPrice)
            }
            .padding()
        }
    }
    
    struct FlightInfoRow: View {
        var flight: Flight
        
        var body: some View {
            HStack {
                Image(systemName: "airplane.departure")
                Text(dateFormatter.string(from: flight.departureHour))
                Spacer()
                Image(systemName: "clock")
                Text(durationFormatter.string(from: flight.arrivalHour.timeIntervalSince(flight.departureHour)) ?? "")
                Spacer()
                Image(systemName: "airplane.arrival")
                Text(dateFormatter.string(from: flight.arrivalHour))
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
    }
    
    struct PriceTag: View {
        var price: Double
        
        var body: some View {
            Text("TRY \(price, specifier: "%.2f")")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
    
    struct BottomBar: View {
        var viewModel: FlightViewModel
        @Binding var passengerCount: Int
        @Binding var selectedFlight: Flight?
        @Binding var selectedPrice: Double?
        
        var body: some View {
            HStack {
                Text(selectedFlight?.flightNumber ?? "UÇUŞUNUZU SEÇİN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                
                if let price = selectedPrice {
                    Text(String(format: "TRY %.2f", price * Double(passengerCount)))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                if selectedFlight != nil {
                    NavigationLink(destination: PassengerDetailsView(flight: $selectedFlight, price: $selectedPrice, passengerCount: $passengerCount, viewModel: viewModel.seatViewModel)) {
                        Text("Devam")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

struct FlightListView_Previews: PreviewProvider {
    @State static var passengerCount = 1
    
    static var previews: some View {
        FlightListView(viewModel: FlightViewModel(),
                       depDate: .constant(Date()),
                       passengerCount: $passengerCount,
                       depAirportIataCode: "IST",
                       arrAirportIataCode: "LHR",
                       retDate: nil)
    }
}
