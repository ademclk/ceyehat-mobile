//
//  EventTicketRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct EventTicketRowView: View {
    var ticket: EventTicket
    
    var body: some View {
        HStack {
            Image(ticket.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(ticket.eventName)
                    .font(.headline)
                Text(ticket.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(ticket.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(String(format: "₺%.2f", ticket.price))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct EventTicketRowView_Previews: PreviewProvider {
    static var previews: some View {
        let eventticket = EventTicket(id: 1, eventName: "", location: "", date: "", price: 1.1, imageName: "", isAvailable: true)
        EventTicketDetailView(ticket: eventticket)
    }
}
