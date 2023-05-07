//
//  PassengerModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class PassengerTests: XCTestCase {
    
    func testToRequestFormat() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let birthDate = dateFormatter.date(from: "1995-06-15")!
        
        let booking = Booking(seatId: "12A", flightId: "12345", price: 500.0, currency: "USD", passengerType: "Adult")
        let passenger = Passenger(name: "John", surname: "Doe", email: "john.doe@example.com", phoneNumber: "+1234567890", title: "Mr", birthDate: birthDate, passengerType: "Adult", userId: "1234", selectedSeat: "12A", bookings: [booking])
        
        let requestFormat = passenger.toRequestFormat()
        
        XCTAssertEqual(requestFormat["name"] as? String, "John")
        XCTAssertEqual(requestFormat["surname"] as? String, "Doe")
        XCTAssertEqual(requestFormat["email"] as? String, "john.doe@example.com")
        XCTAssertEqual(requestFormat["phoneNumber"] as? String, "+1234567890")
        XCTAssertEqual(requestFormat["title"] as? Int, 0)
        XCTAssertEqual(requestFormat["birthDate"] as? String, "1995-06-15T00:00:00Z")
        XCTAssertEqual(requestFormat["passengerType"] as? Int, 0)
        XCTAssertEqual(requestFormat["userId"] as? String, "1234")
        
        if let bookingsJson = requestFormat["addBookingRequests"] as? [[String: Any]], let bookingJson = bookingsJson.first {
            XCTAssertEqual(bookingJson["seatId"] as? String, "12A")
            XCTAssertEqual(bookingJson["flightId"] as? String, "12345")
            XCTAssertEqual(bookingJson["price"] as? Double, 500.0)
            XCTAssertEqual(bookingJson["currency"] as? Int, 15)
            XCTAssertEqual(bookingJson["passengerType"] as? Int, 0)
        } else {
            XCTFail("Bookings not found in request format.")
        }
    }
}
