//
//  TicketView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.04.2023.
//

import SwiftUI

struct TicketView: View {
    @Binding var flight: Flight?
    @Binding var passenger: [Passenger]
    
    @StateObject private var viewModel = TicketViewModel()
    
    var body: some View {
        VStack {
            Text("\(flight?.flightNumber ?? "") Biletleri")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            if viewModel.isLoading {
                ProgressView("Yükleniyor ...")
            } else {
                List(viewModel.flightTickets) { ticket in
                    
                    VStack(alignment: .leading) {
                        Text("Bilet Numarası: \(ticket.id)")
                            .font(.headline)
                    
                    }
                }
            }
        }
        .onAppear {
            viewModel.createTickets(for: passenger, flightId: flight?.flightNumber ?? "")
        }
    }
}

struct TicketView_Previews: PreviewProvider {
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
        TicketView(flight: .constant(sampleFlight), passenger: .constant(passengers))
    }
}
