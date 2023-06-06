//
//  FlightItinaryList.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 4.06.2023.
//

import SwiftUI

struct FlightItineraryList: View {
    var flightTickets: [FlightSegment]
    
    var body: some View {
        List(flightTickets) { flightTicket in
            Section {
                VStack {
                    FlightSegmentSectionHeader(segment: flightTicket)
                    Divider()
                    HStack {
                        FlightLegRowHeader(title: "Kalkış", airportCode: flightTicket.ticket.departureIata, airportName: flightTicket.ticket.departureName, date: flightTicket.ticket.departureDate, hour: flightTicket.ticket.departureTime)
                        Spacer()
                        FlightLegRowHeader(title: "Varış", airportCode: flightTicket.ticket.arrivalIata, airportName: flightTicket.ticket.arrivalName, date: flightTicket.ticket.arrivalDate, hour: flightTicket.ticket.arrivalTime)
                    }
                    .padding()
                    Divider()
                    FlightLegRowFooter(id: flightTicket.ticket.id, status: flightTicket.ticket.status, price: flightTicket.ticket.price, currency: flightTicket.ticket.currency)
                }
            }
        }
    }
}


struct FlightItinaryList_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = FlightTicket(id: "12131232132132-1231232-123123123", name: "Adem Onur", surname: "Çelik", flightNumber: "AI000012", departureIata: "ESB", departureName: "Esenboğa Havalimanı", arrivalIata: "SAW", arrivalName: "Sabiha Gökçen Uluslararası Havalimanı", departureDate: "11.06.2023", arrivalDate: "11.06.2023", departureTime: "06:30", arrivalTime: "07:30", seatNumber: nil, price: 545.3621, currency: "TRY", status: "Scheduled")
        
        let segment = [FlightSegment(ticket: ticket)]
        
        FlightItineraryList(flightTickets: segment)
    }
}
