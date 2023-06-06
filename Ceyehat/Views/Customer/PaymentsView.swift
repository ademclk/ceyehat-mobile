//
//  PaymentsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 30.03.2023.
//

import SwiftUI

struct PaymentsView: View {
    @Binding var flight: Flight?
    @Binding var passengers: [Passenger]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Ödeme Yöntemi Seçin")
                .font(.title)
                .fontWeight(.bold)
                    
            List {
                Section {
                    Text("Kredi Kartı")
                }
                Section {
                    Text("Banka Kartı")
                }
                Section {
                    Text("Google Pay")
                }
                Section {
                    Text("Apple Pay")
                }
            }
            .listStyle(InsetListStyle())
            
            Spacer()
            
            NavigationLink(destination: TicketView(flight: $flight, passenger: $passengers)) {
                Text("Ödemeyi Tamamla")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Ödeme")
    }
}

struct PaymentsView_Previews: PreviewProvider {
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
        PaymentsView(flight: .constant(sampleFlight), passengers: .constant(passengers))
    }
}
