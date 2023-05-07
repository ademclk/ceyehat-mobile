//
//  AuthenticationRequestsModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class AuthRequestTests: XCTestCase {
    
    func testLoginRequestModel() {
        let loginRequest = LoginRequest(email: "john.doe@example.com", password: "password123")
        
        XCTAssertEqual(loginRequest.email, "john.doe@example.com")
        XCTAssertEqual(loginRequest.password, "password123")
    }
    
    func testRegisterRequestModel() {
        let registerRequest = RegisterRequest(email: "john.doe@example.com", password: "password123", firstName: "John", lastName: "Doe")
        
        XCTAssertEqual(registerRequest.email, "john.doe@example.com")
        XCTAssertEqual(registerRequest.password, "password123")
        XCTAssertEqual(registerRequest.firstName, "John")
        XCTAssertEqual(registerRequest.lastName, "Doe")
    }
}

