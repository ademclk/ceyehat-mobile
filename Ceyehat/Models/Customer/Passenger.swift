//
//  Passenger.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Passenger` model represents a single passenger.
///
/// Each passenger has a name, surname, email, phone number, title, birth date, and passenger type. Additionally, the passenger can have a user ID, a selected seat, and a list of bookings.
struct Passenger: Hashable, Codable {
    var name: String
    var surname: String
    var email: String
    var phoneNumber: String
    var title: String
    var birthDate: Date
    var passengerType: String
    var userId: String?
    var selectedSeat: String?
    var bookings: [Booking]
}

extension Passenger {
    /// Converts the `Passenger` model to a dictionary format suitable for making an API request.
    ///
    /// - Returns: A dictionary representing the passenger and their bookings.
    func toRequestFormat() -> [String: Any] {
        var requestFormat: [String: Any] = [
            "name": name,
            "surname": surname,
            "email": email,
            "phoneNumber": phoneNumber,
            "title": title.codingKey.intValue ?? 0,
            "birthDate": ISO8601DateFormatter().string(from: birthDate),
            "passengerType": passengerType.codingKey.intValue ?? 0
        ]
        
        if let userId = userId {
            requestFormat["userId"] = userId
        }
        
        if let passengerTypeInt = PassengerType(rawValue: passengerType)?.intValue {
            requestFormat["passengerType"] = passengerTypeInt
        }
        
        let bookingsJson: [[String: Any]] = bookings.map { booking in
            [
                "seatId": booking.seatId ?? "",
                "flightId": booking.flightId,
                "price": booking.price,
                "currency": 15, // booking.currency | Currency not implemented. 15 = TRY
                "passengerType": PassengerType(rawValue: booking.passengerType)?.intValue ?? 0
            ]
        }
        
        requestFormat["addBookingRequests"] = bookingsJson
        
        return requestFormat
    }
}

/// The `PassengerType` enumeration represents the type of a passenger, such as adult, child, infant, disabled, or student.
extension PassengerType {
    var intValue: Int {
        switch self {
        case .adult:
            return 0
        case .child:
            return 1
        case .infant:
            return 2
        case .disabled:
            return 3
        case .student:
            return 4
        }
    }
}

/// The `PassengerTitle` enumeration represents the title of a passenger, such as Mr. or Ms.
extension PassengerTitle {
    var intValue: Int {
        switch self {
        case .mr:
            return 0
        case .ms:
            return 1
        }
    }
}

