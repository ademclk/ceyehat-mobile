//
//  EventTicketView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct EventTicketView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    
    var filteredEventTickets: [EventTicket] {
        sampleEventTickets
            .filter { ticket in
                (ticket.eventName.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (showOnlyAvailable ? ticket.isAvailable : true)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Etkinlik adı girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                List(filteredEventTickets) { ticket in
                    NavigationLink(destination: EventTicketDetailView(ticket: ticket)) {
                        EventTicketRowView(ticket: ticket)
                    }
                }
            }
            .navigationBarTitle("Etkinlik Biletleri", displayMode: .inline)
        }
    }
}

struct EventTicketView_Previews: PreviewProvider {
    static var previews: some View {
        EventTicketView()
    }
}
