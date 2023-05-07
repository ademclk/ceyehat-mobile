//
//  AirportModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class AirportTests: XCTestCase {
    
    func testAirportModel() {
        let airport = Airport(name: "John F. Kennedy International Airport", iataCode: "JFK", cityName: "New York", countryName: "United States")
        
        XCTAssertEqual(airport.name, "John F. Kennedy International Airport")
        XCTAssertEqual(airport.iataCode, "JFK")
        XCTAssertEqual(airport.cityName, "New York")
        XCTAssertEqual(airport.countryName, "United States")
    }
}


