//
//  TrainTicket.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct TrainTicket: Identifiable {
    var id: Int
    var departureStation: String
    var arrivalStation: String
    var departureTime: String
    var arrivalTime: String
    var isAvailable: Bool
}

let sampleTrainTickets = [
    TrainTicket(id: 1, departureStation: "İstanbul", arrivalStation: "Ankara", departureTime: "10:00", arrivalTime: "13:30", isAvailable: true),
    TrainTicket(id: 2, departureStation: "İzmir", arrivalStation: "Ankara", departureTime: "08:30", arrivalTime: "14:00", isAvailable: false),
    TrainTicket(id: 3, departureStation: "Ankara", arrivalStation: "İstanbul", departureTime: "15:45", arrivalTime: "19:10", isAvailable: true),
    TrainTicket(id: 4, departureStation: "Antalya", arrivalStation: "İzmir", departureTime: "12:15", arrivalTime: "18:40", isAvailable: true),
    TrainTicket(id: 5, departureStation: "Bursa", arrivalStation: "İstanbul", departureTime: "09:20", arrivalTime: "11:45", isAvailable: false),
]
