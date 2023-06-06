//
//  BookingDetailsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 3.06.2023.
//

import SwiftUI

struct BookingBody: View {
    var booking: Booking
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(booking.seatNumber ?? "??")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                Text(booking.passengerType)
                    .font(.title2)
            }
            Text(booking.seatId ?? "Koltuk seçimi yapılmamış.")
                .font(.caption)
        }
    }
}


struct BookingBody_Previews: PreviewProvider {
    static let bookings = [Booking(bookingId: "12345678-1234-1234-1234-123456789012", seatId: "15678658-1234-1234-1234-165432567886", seatNumber: "1A", flightId: "12345678-1234-1654-1234-4422445", flightNumber: "AA123", currency: "USD", price: 129.0, passengerType: "Yetişkin")]
    
    static var previews: some View {
        BookingBody(booking: bookings[0])
    }
}
