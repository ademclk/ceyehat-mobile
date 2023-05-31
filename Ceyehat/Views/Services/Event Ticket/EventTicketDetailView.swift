//
//  EventTicketDetailView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct EventTicketDetailView: View {
    var ticket: EventTicket
    
    var body: some View {
        VStack {
            Image(ticket.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
            
            Text(ticket.eventName)
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text(ticket.location)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text(ticket.date)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text(String(format: "₺%.2f", ticket.price))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(ticket.eventName)
    }
}

struct EventTicketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let eventticket = EventTicket(id: 1, eventName: "", location: "", date: "", price: 1.1, imageName: "", isAvailable: true)
        EventTicketDetailView(ticket: eventticket)
    }
}
