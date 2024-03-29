//
//  Service.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 15.05.2023.
//

import Foundation
import SwiftUI

struct Service {
    var name: String
    var description: String
    var imageName: String
    var color: Color
    var destination: () -> AnyView
}

let services: [Service] = [
    Service(name: "Otel Rezervasyonu", description: "En iyi otellerde konaklayın", imageName: "bed.double.fill", color: .purple, destination: { AnyView(HotelReservationView()) }),
    Service(name: "Araç Kiralama", description: "İstediğiniz aracı kiralayın", imageName: "car.fill", color: .blue, destination: { AnyView(CarRentalView()) }),
    Service(name: "Taksi Çağırma", description: "Hızlı ve güvenli taksi çağırın", imageName: "car.side.fill", color: .yellow, destination: { AnyView(TaxiCallView()) }),
    Service(name: "Tur Organizasyonu", description: "Heyecan verici turlara katılın", imageName: "map.fill", color: .red, destination: { AnyView(TourOrganizerView()) }),
    Service(name: "Tren Bileti", description: "Tren yolculuğunu deneyin", imageName: "tram.fill", color: .orange, destination: { AnyView(TrainTicketView()) }),
    Service(name: "Yemek Servisi", description: "Lezzetli yerel yemekler sipariş edin", imageName: "bag.fill", color: .pink, destination: { AnyView(FoodServiceView()) }),
    Service(name: "Rehber", description: "Profesyonel bir rehberle gezin", imageName: "person.fill.questionmark", color: .teal, destination: { AnyView(TourGuideView()) }),
    Service(name: "Etkinlik Biletleri", description: "Konser, tiyatro, festival ve daha fazlası", imageName: "ticket.fill", color: .orange, destination: { AnyView(EventTicketView()) }),
]
