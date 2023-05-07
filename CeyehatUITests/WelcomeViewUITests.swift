//
//  WelcomeViewUITests.swift
//  CeyehatUITests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class CeyehatWelcomeViewTests: XCTestCase {
    
    // MARK: - Unit Tests
    
    func testExample() throws {
        // TODO: Add unit tests for your app's business logic
    }
    
    // MARK: - UI Tests
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testWelcomeView() throws {
        // Check if navigation bar title is correct
        let navigationBarTitle = app.navigationBars.staticTexts["Ceyehat"]
        XCTAssertTrue(navigationBarTitle.exists)
        XCTAssertEqual(navigationBarTitle.label, "Ceyehat")
        
        // Check if "Bilet al" button exists and has correct title
        let biletAlButton = app.buttons["Bilet al"]
        XCTAssertTrue(biletAlButton.exists)
        XCTAssertTrue(biletAlButton.isHittable)
        XCTAssertEqual(biletAlButton.label, "Bilet al")
        
        // Tap "Bilet al" button and wait for the next view to appear
        let biletAlExpectation = expectation(for: NSPredicate(format: "self.exists == true"), evaluatedWith: app.navigationBars["Bilet al"], handler: nil)
        biletAlButton.tap()
        wait(for: [biletAlExpectation], timeout: 5)
        
        // Check if the "Bilet al" view has the correct title
        let biletAlTitle = app.navigationBars["Bilet al"].staticTexts["Bilet al"]
        XCTAssertTrue(biletAlTitle.exists)
        XCTAssertEqual(biletAlTitle.label, "Bilet al")
        
        // Go back to the WelcomeView and check if the "Check-in" button exists and is enabled
        app.navigationBars.buttons["Ceyehat"].tap()
        let checkInButton = app.buttons["Check-in"]
        XCTAssertTrue(checkInButton.exists)
        XCTAssertTrue(checkInButton.isHittable)
        XCTAssertTrue(checkInButton.isEnabled)
        
        // Tap "Check-in" button and wait for the next view to appear
        let checkInExpectation = expectation(for: NSPredicate(format: "self.exists == true"), evaluatedWith: app.navigationBars["Check-in"], handler: nil)
        checkInButton.tap()
        wait(for: [checkInExpectation], timeout: 5)
        
        // Check if the "Check-in" view has the correct title
        let checkInTitle = app.navigationBars["Check-in"].staticTexts["Check-in"]
        XCTAssertTrue(checkInTitle.exists)
        XCTAssertEqual(checkInTitle.label, "Check-in")
    }
    
    // MARK: - Performance Tests
    
    func testSumPerformance() {
        let numbers = [Int](repeating: 1, count: 10000)
        measure {
            let sum = numbers.reduce(0, +)
            XCTAssertEqual(sum, 10000)
        }
    }
}
