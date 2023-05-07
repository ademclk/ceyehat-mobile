//
//  BaseApiClientTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class BaseApiClientTests: XCTestCase {
    var baseApiClient: MockBaseApiClient!
    
    override func setUp() {
        super.setUp()
        baseApiClient = MockBaseApiClient()
    }
    
    override func tearDown() {
        baseApiClient = nil
        super.tearDown()
    }
    
    func testMakeAPICallSuccess() {
        let jsonData = """
        {
            "id": 1,
            "name": "John Doe"
        }
        """.data(using: .utf8)
        baseApiClient.data = jsonData
        
        let url = URL(string: "https://api.example.com/user")!
        let request = URLRequest(url: url)
        baseApiClient.makeAPICall(url: url, request: request) { (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                XCTAssertEqual(user.id, 1)
                XCTAssertEqual(user.name, "John Doe")
            case .failure:
                XCTFail("Expected success but received an error")
            }
        }
    }
    
    func testMakeAPICallFailure() {
        let error = NSError(domain: "", code: 0, userInfo: nil)
        baseApiClient.error = error
        
        let url = URL(string: "https://api.example.com/user")!
        let request = URLRequest(url: url)
        baseApiClient.makeAPICall(url: url, request: request) { (result: Result<User, Error>) in
            switch result {
            case .success:
                XCTFail("Expected an error but received success")
            case .failure(let receivedError):
                XCTAssertEqual((receivedError as NSError).code, error.code)
            }
        }
    }
}

struct User: Codable {
    let id: Int
    let name: String
}

