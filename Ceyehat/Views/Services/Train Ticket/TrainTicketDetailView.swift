//
//  TrainTicketDetailView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TrainTicketDetailView: View {
    var ticket: TrainTicket
    
    var body: some View {
        VStack {
            Text("Kalkış: \(ticket.departureStation)")
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text("Varış: \(ticket.arrivalStation)")
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text("Kalkış Saati: \(ticket.departureTime)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("Varış Saati: \(ticket.arrivalTime)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Bilet Detayı")
    }
}

struct TrainTicketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = TrainTicket(id: 1, departureStation: "", arrivalStation: "", departureTime: "", arrivalTime: "", isAvailable: true)
        TrainTicketDetailView(ticket: ticket)
    }
}
