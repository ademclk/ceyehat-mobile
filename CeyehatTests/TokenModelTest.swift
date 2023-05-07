//
//  TokenModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class TokenTests: XCTestCase {
    
    func testTokenModel() {
        let expireDate = Date().addingTimeInterval(60 * 60 * 24) // One day later
        let token = Token(accessToken: "abcd1234", expireDate: expireDate, refreshToken: "efgh5678")
        
        XCTAssertEqual(token.accessToken, "abcd1234")
        XCTAssertEqual(token.expireDate, expireDate)
        XCTAssertEqual(token.refreshToken, "efgh5678")
    }
}


