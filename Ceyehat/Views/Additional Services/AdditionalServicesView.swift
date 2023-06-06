//
//  AdditionalServicesView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 22.03.2023.
//

import SwiftUI

struct AdditionalServicesView: View {
    @ObservedObject var viewModel: SeatViewModel
    @Binding var flight: Flight?
    @Binding var passenger: [Passenger]
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("")) {
                    VStack {
                        Text("Koltuğunuzu Seçin")
                            .font(.headline)
                        NavigationLink(destination: SeatSelectionView(viewModel: viewModel, flight: $flight, passengers: $passenger) ) {
                            HStack {
                                Image(systemName: "chair.lounge.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60)
                                Spacer()
                                VStack {
                                    Text("Koltuk seçimi")
                                    Text("Koltuk seçimi")
                                }
                                Spacer()
                            }
                        }
                        .navigationTitle("Koltuk Seç")
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(destination: PaymentsView(flight: $flight, passengers: $passenger)) {
                Text("Devam")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct AdditionalServicesView_Previews: PreviewProvider {
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
    
    static let bookings = [Booking(bookingId: "", seatId: "", seatNumber: "", flightId: "", flightNumber: "", currency: "", price: 12.0, passengerType: "")]
    
    static let passenger = Passenger(name: "", surname: "", email: "", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
    
    static let passengers = [passenger]
    
    static var previews: some View {
        AdditionalServicesView(viewModel: SeatViewModel(), flight: .constant(sampleFlight), passenger: .constant(passengers))
    }
}
