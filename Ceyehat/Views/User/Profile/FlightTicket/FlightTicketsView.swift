//
//  FlightTicketsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 4.06.2023.
//

import SwiftUI

struct FlightTicketsView: View {
    var flightTickets: [FlightTicket]
    
    var body: some View {
        NavigationView {
            FlightItineraryList(flightTickets: flightTickets.map { FlightSegment(ticket: $0) })
                .navigationTitle("Biletlerim")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct FlightTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = FlightTicket(id: "1", name: "Adem Onur", surname: "Çelik", flightNumber: "AI000012", departureIata: "ESB", departureName: "Esenboğa Havalimanı", arrivalIata: "SAW", arrivalName: "Sabiha Gökçen Uluslararası Havalimanı", departureDate: "11.06.2023", arrivalDate: "11.06.2023", departureTime: "06:30", arrivalTime: "07:30", seatNumber: nil, price: 545.3621, currency: "TRY", status: "Scheduled")
        FlightTicketsView(flightTickets: [ticket])
    }
}
