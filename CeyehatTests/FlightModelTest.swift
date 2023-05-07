//
//  FlightModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class FlightTests: XCTestCase {
    
    func testFlightModel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let departureHour = dateFormatter.date(from: "2023-05-10T09:00:00.000Z")!
        let arrivalHour = dateFormatter.date(from: "2023-05-10T12:00:00.000Z")!
        
        let flight = Flight(flightNumber: "AA123", airlineName: "American Airlines", aircraftName: "Boeing 737", departureHour: departureHour, arrivalHour: arrivalHour, economyPrice: 500.0, comfortPrice: 700.0, businessPrice: 1200.0)
        
        XCTAssertEqual(flight.flightNumber, "AA123")
        XCTAssertEqual(flight.airlineName, "American Airlines")
        XCTAssertEqual(flight.aircraftName, "Boeing 737")
        XCTAssertEqual(flight.departureHour, departureHour)
        XCTAssertEqual(flight.arrivalHour, arrivalHour)
        XCTAssertEqual(flight.economyPrice, 500.0)
        XCTAssertEqual(flight.comfortPrice, 700.0)
        XCTAssertEqual(flight.businessPrice, 1200.0)
    }
    
    func testFlightModelJSONDecoding() {
        let json = """
        {
            "flightNumber": "AA123",
            "airlineName": "American Airlines",
            "aircraftName": "Boeing 737",
            "departureHour": "2023-05-10T09:00:00.000Z",
            "arrivalHour": "2023-05-10T12:00:00.000Z",
            "economyPrice": 500.0,
            "comfortPrice": 700.0,
            "businessPrice": 1200.0
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let flight = try decoder.decode(Flight.self, from: json)
            testFlightModel()
        } catch {
            XCTFail("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
