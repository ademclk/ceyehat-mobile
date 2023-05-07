//
//  UserAuthModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class UserAuthTests: XCTestCase {
    
    func testUserAuth() {
        let userAuth = UserAuth()
        
        XCTAssertFalse(userAuth.isAuthenticated)
        
        let expireDate = Date().addingTimeInterval(60 * 60 * 24)
        let token = Token(accessToken: "test-access-token", expireDate: expireDate, refreshToken: "test-refresh-token")
        
        userAuth.updateToken(token)
        
        XCTAssertTrue(userAuth.isAuthenticated)
        XCTAssertEqual(userAuth.token?.accessToken, "test-access-token")
        
        userAuth.clearToken()
        
        XCTAssertFalse(userAuth.isAuthenticated)
        XCTAssertNil(userAuth.token)
    }
}

