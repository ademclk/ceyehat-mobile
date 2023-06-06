//
//  BookingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 3.06.2023.
//

import SwiftUI

struct BookingsView: View {
    var bookings: [Booking]
    
    var body: some View {
        NavigationView {
            BookingsList(bookings: bookings)
                .navigationTitle("Rezervasyonlarım")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct BookingsView_Previews: PreviewProvider {
    static let bookings = [Booking(bookingId: "12345678-1234-1234-1234-123456789012", seatId: "15678658-1234-1234-1234-165432567886", seatNumber: "1A", flightId: "12345678-1234-1654-1234-4422445", flightNumber: "AA123", currency: "USD", price: 129.0, passengerType: "Adult")]
    
    static var previews: some View {
        BookingsView(bookings: bookings)
    }
}

