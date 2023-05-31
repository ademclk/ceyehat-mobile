//
//  TrainTicketRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TrainTicketRowView: View {
    var ticket: TrainTicket
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(ticket.departureStation)
                    .font(.headline)
                Text("→")
                    .font(.headline)
                Text(ticket.arrivalStation)
                    .font(.headline)
            }
            Text("\(ticket.departureTime) - \(ticket.arrivalTime)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

struct TrainTicketRowView_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = TrainTicket(id: 1, departureStation: "", arrivalStation: "", departureTime: "", arrivalTime: "", isAvailable: true)
        TrainTicketRowView(ticket: ticket)
    }
}
