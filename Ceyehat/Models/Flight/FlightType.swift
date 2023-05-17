//
//  FlightType.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 14.05.2023.
//

import Foundation

enum FlightType: Int, CaseIterable, Identifiable, Sendable {
    case oneWay
    case roundTrip
    case multiCity
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .oneWay:
            return "Tek Yön"
        case .roundTrip:
            return "Gidiş-Dönüş"
        case .multiCity:
            return "Çoklu Uçuş"
        }
    }
    
    var systemImage: String {
        switch self {
        case .oneWay:
            return "arrow.right"
        case .roundTrip:
            return "arrow.right.arrow.left"
        case .multiCity:
            return "arrow.up.backward.and.arrow.down.forward"
        }
    }
}
