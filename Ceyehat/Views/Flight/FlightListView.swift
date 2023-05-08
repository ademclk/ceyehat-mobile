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
        VStack {
            if isLoading {
                ProgressView()
            } else if viewModel.flights.isEmpty {
                Spacer(minLength: 60)
                HStack {
                    Image(systemName: "exclamationmark.circle")
                    Text("Seçilen tarih ve güzergahta uçuş bulunamadı veya tüm uçuşlar dolu. Farklı bilgilerle yeniden arama yapabilirsiniz.")
                        .font(.headline)
                }
                .padding()
            }
            List(viewModel.flights, id: \.flightNumber) { flight in
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(flight.flightNumber) - \(flight.airlineName)")
                            .font(.headline)
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
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.cyan)
                            .overlay(Text("TRY \(flight.economyPrice, specifier: "%.2f")")
                                .bold()
                                .foregroundColor(.white))
                    }
                    .onTapGesture {
                        viewModel.selectFlight(flight)
                        viewModel.showFlightPriceSheet = true
                    }
                }
                .padding()
            }
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.green)
                    .frame(maxHeight: 55)
                    .overlay(
                        VStack {
                            Text(viewModel.selectedFlight?.flightNumber ?? "Toplam")
                                .fontWeight(.bold)
                            if let price = viewModel.selectedPrice {
                                Text(String(format: "TRY %.2f", price * Double(passengerCount)))
                            } else {
                                Text("")
                            }
                        })
                    .padding()
                
                if viewModel.selectedFlight != nil {
                    NavigationLink(destination: PassengerDetailsView(flight: $viewModel.selectedFlight, price: $viewModel.selectedPrice, passengerCount: $passengerCount, viewModel: viewModel.seatViewModel)) {
                        Text("Devam")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .navigationTitle("Uçuşlar")
                    .padding()
                }
            }
            .navigationTitle("Uçuşlar")
            .navigationBarItems(trailing:
                                    DatePicker("", selection: $depDate, in: Date()...Date().addingTimeInterval(30*24*60*60), displayedComponents: .date)
                .datePickerStyle(.compact)
                .environment(\.locale, Locale(identifier: "tr_TR"))
                .onChange(of: depDate) { newValue in
                    depDate = newValue
                    viewModel.searchFlights(departureAirportIataCode: depAirportIataCode, arrivalAirportIataCode: arrAirportIataCode, departureDate: newValue, returnDate: retDate, passengerCount: passengerCount)
                }
            )
            .sheet(isPresented: $viewModel.showFlightPriceSheet) {
                if let flight = viewModel.selectedFlight {
                    FlightPriceView(flight: flight, showFlightPriceSheet: $viewModel.showFlightPriceSheet, selectedFlight: $viewModel.selectedFlight, selectedPrice: $viewModel.selectedPrice, viewModel: viewModel.seatViewModel)
                }
            }
            .onAppear() {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    viewModel.searchFlights(departureAirportIataCode: depAirportIataCode, arrivalAirportIataCode: arrAirportIataCode, departureDate: depDate, returnDate: retDate, passengerCount: passengerCount)
                    isLoading = false
                }
            }
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
