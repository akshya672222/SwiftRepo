//
//  RefactorTest.swift
//  RefactorTest
//
//  Created by AKSHAY SUNDERWANI on 11/10/16.
//  Copyright © 2016 AKSHAY SUNDERWANI. All rights reserved.
//

import XCTest
import Homework06_Refactoring_AkshaySunderwani

class RefactorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //test for refactoring for file Refactor2
        
        //Note date format must be in : "YYYY-MM-dd"
        
        //compare date with first target date
        let days = Refactor2.getDays(date_to_compare: "2020-01-15", date: "2000-01-01")
        XCTAssertEqual(days, 7319)  //days
        XCTAssertEqual(Int(Float(days)/30.4), 240)  //months
        XCTAssertEqual(Int(Float(days)/365.35), 20)  //years
        
        //compare date with second target date
        let days2 = Refactor2.getDays(date_to_compare: "2020-01-15", date: "2016-10-03")
        XCTAssertEqual(days2, 1199)  //days
        XCTAssertEqual(Int(Float(days2)/30.4), 39)  //months
        XCTAssertEqual(Int(Float(days2)/365.35), 3)  //years

        //test for refactoring for file Refactor1
        let dict = Refactor1.getDays(date_to_compare: "2020-01-15", date1 : "2000-01-01", date2 : "2016-10-03")
        
        //test for comparing date with first target date
        XCTAssertEqual(dict["date1"]?["days"], 7319)
        XCTAssertEqual(dict["date1"]?["months"], 240)
        XCTAssertEqual(dict["date1"]?["years"], 20)
        
        //test for comparing date with second target date
        XCTAssertEqual(dict["date2"]?["days"], 1199)
        XCTAssertEqual(dict["date2"]?["months"], 39)
        XCTAssertEqual(dict["date2"]?["years"], 3)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.            
        }
    }
    
}
