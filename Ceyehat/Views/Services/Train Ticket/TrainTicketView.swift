//
//  TrainTicketView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TrainTicketView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    
    var filteredTrainTickets: [TrainTicket] {
        sampleTrainTickets
            .filter { ticket in
                (ticket.departureStation.lowercased().contains(searchText.lowercased()) ||
                 ticket.arrivalStation.lowercased().contains(searchText.lowercased()) ||
                 searchText.isEmpty) &&
                (showOnlyAvailable ? ticket.isAvailable : true)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Kalkış veya varış istasyonu girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                List(filteredTrainTickets) { ticket in
                    NavigationLink(destination: TrainTicketDetailView(ticket: ticket)) {
                        TrainTicketRowView(ticket: ticket)
                    }
                }
            }
            .navigationBarTitle("Tren Bileti", displayMode: .inline)
        }
    }
}
struct TrainTicketView_Previews: PreviewProvider {
    static var previews: some View {
        TrainTicketView()
    }
}
