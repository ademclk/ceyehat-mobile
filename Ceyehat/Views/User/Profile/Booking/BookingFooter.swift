//
//  BookingFooter.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.06.2023.
//

import SwiftUI

struct BookingFooter: View {
    var booking: Booking
    
    var body: some View {
        Text(booking.bookingId)
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct BookingFooter_Previews: PreviewProvider {
    static let booking = Booking(bookingId: "12345678-1234-1234-1234-123456789012", seatId: "15678658-1234-1234-1234-165432567886", seatNumber: "1A", flightId: "12345678-1234-1654-1234-4422445", flightNumber: "AA123", currency: "USD", price: 129.0, passengerType: "Adult")
    
    static var previews: some View {
        BookingFooter(booking: booking)
    }
}
