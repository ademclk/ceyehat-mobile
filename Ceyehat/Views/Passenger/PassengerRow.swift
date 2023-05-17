//
//  PassengerRow.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 21.03.2023.
//

import SwiftUI

struct PassengerRow: View {
    let passenger: Passenger
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.green)
                .frame(width: 50, height: 50)
                .overlay(
                    Text(String("\(passenger.name.prefix(1))\(passenger.surname.prefix(1))")))
                .font(.headline)
            
            VStack {
                HStack {
                    Text("\(passenger.name) \(passenger.surname)")
                        .font(.headline)
                }
            }
        }
    }
}

struct PassengerRow_Previews: PreviewProvider {
    static var previews: some View {
        let bookings = [Booking(flightId: "334", price: 123.00, currency: "TRY", passengerType: "0")]
        
        let passenger = Passenger(name: "", surname: "", email: "", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
        
        PassengerRow(passenger: passenger)
    }
}
