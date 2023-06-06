//
//  ShowPassengerDetailsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 22.03.2023.
//

import SwiftUI

struct ShowPassengerDetailsView: View {
    @Binding var passenger: Passenger?
    
    var body: some View {
        VStack {
            Text("Yolcu Bilgileri")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            List {
                Section(header: Text("Ad")) {
                    Text(passenger!.name)
                }
                Section(header: Text("Soyad")) {
                    Text(passenger!.surname)
                }
                Section(header: Text("E-posta Adresi")) {
                    Text(passenger!.email)
                }
                Section(header: Text("Doğum Tarihi")) {
                    Text(birthDateFormater.string(from: passenger!.birthDate))
                }
                Section(header: Text("Telefon Numarası")) {
                    Text(passenger!.phoneNumber)
                }
            }
            .listStyle(InsetListStyle())
            .bold()
        .padding()
        }
    }
}

struct ShowPassengerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let bookings = [Booking(bookingId: "", seatId: "", seatNumber: "", flightId: "", flightNumber: "", currency: "", price: 12.0, passengerType: "")]
        
        let passenger = Passenger(name: "", surname: "", email: "", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
        
        ShowPassengerDetailsView(passenger: .constant(passenger))
    }
}
