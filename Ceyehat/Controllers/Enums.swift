//
//  Enums.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

enum SeatType: Int {
    case economy = 0
    case comfort = 1
    case business = 2
    
    var description: String {
        switch self {
        case .economy:
            return "Ekonomi"
        case .comfort:
            return "Komfor"
        case .business:
            return "Business"
        }
    }
}

enum PassengerType: String, CaseIterable {
    case adult = "Yetişkin"
    case child = "Çocuk"
    case infant = "Bebek"
    case disabled = "Engelli"
    case student = "Öğrenci"
    
    var description: String {
        self.rawValue
    }
}

enum PassengerTitle: String, CaseIterable {
    case mr = "Bay"
    case ms = "Bayan"
    
    var description: String {
        self.rawValue
    }
}

enum Currency: String, CaseIterable {
    case turkishLira = "TRY"
    case unitedStatesDollar = "USD"
    case euro = "EUR"
}

