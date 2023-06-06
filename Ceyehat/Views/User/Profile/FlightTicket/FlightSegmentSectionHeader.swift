//
//  FlightSegmentSectionHeader.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 4.06.2023.
//

import SwiftUI

struct FlightSegmentSectionHeader: View {
    var segment: FlightSegment
    
    var body: some View {
        Text(segment.ticket.name + " " + segment.ticket.surname + " - " + segment.ticket.flightNumber)
            .font(.headline)
            .textCase(.none)
            .foregroundColor(.accentColor)
    }
}


struct FlightSegmentSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = FlightTicket(id: "1", name: "Adem Onur", surname: "Çelik", flightNumber: "AI000012", departureIata: "ESB", departureName: "Esenboğa Havalimanı", arrivalIata: "SAW", arrivalName: "Sabiha Gökçen Uluslararası Havalimanı", departureDate: "11.06.2023", arrivalDate: "11.06.2023", departureTime: "06:30", arrivalTime: "07:30", seatNumber: nil, price: 545.3621, currency: "TRY", status: "Scheduled")
        
        FlightSegmentSectionHeader(segment: FlightSegment(ticket: ticket))
    }
}
