//
//  BookingsList.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.06.2023.
//

import SwiftUI

struct BookingsList: View {
    var bookings: [Booking]
    
    var body: some View {
        List(bookings, id: \.self) { booking in
            Section {
                VStack {
                    BookingRowSectionHeader(flightNumber: booking.flightNumber)
                    Divider()
                    BookingBody(booking: booking)
                    Divider()
                    BookingFooter(booking: booking)
                }
            }
        }
    }
}

struct BookingsList_Previews: PreviewProvider {
    static var previews: some View {
        let bookings = [Booking(bookingId: "12345678-1234-1234-1234-123456789012", seatId: "15678658-1234-1234-1234-165432567886", seatNumber: "1A", flightId: "12345678-1234-1654-1234-4422445", flightNumber: "AA123", currency: "USD", price: 129.0, passengerType: "Adult")]
        
        BookingsList(bookings: bookings)
    }
}
