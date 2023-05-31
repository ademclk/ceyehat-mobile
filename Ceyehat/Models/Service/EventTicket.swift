//
//  EventTicket.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct EventTicket: Identifiable {
    var id: Int
    var eventName: String
    var location: String
    var date: String
    var price: Double
    var imageName: String
    var isAvailable: Bool
}

let sampleEventTickets = [
    EventTicket(id: 1, eventName: "Event 1", location: "Istanbul", date: "May 30, 2023", price: 59.99, imageName: "event1", isAvailable: true),
    EventTicket(id: 2, eventName: "Event 2", location: "Ankara", date: "June 15, 2023", price: 49.99, imageName: "event2", isAvailable: false),
    EventTicket(id: 3, eventName: "Event 3", location: "Izmir", date: "July 10, 2023", price: 79.99, imageName: "event3", isAvailable: true),
    EventTicket(id: 4, eventName: "Event 4", location: "Antalya", date: "August 5, 2023", price: 64.99, imageName: "event4", isAvailable: true),
    EventTicket(id: 5, eventName: "Event 5", location: "Bursa", date: "September 1, 2023", price: 69.99, imageName: "event5", isAvailable: false),
]

