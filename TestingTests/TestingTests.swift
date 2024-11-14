//
//  TestingTests.swift
//  TestingTests
//
//  Created by Hatice Taşdemir on 10.11.2024.
//

import XCTest
@testable import Testing
//unit tests
final class TestingTests: XCTestCase {

    /* override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class. testeleri çalıştırmadan önce bir şey yapmak istiyorsak burada çalıştırırız
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class. bittikten sonra bir şey yapmak cevapları görmek istersek burası
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/

    //unit tests
    let math = MathsFuncs()
    func testAddIntFunc() {
        let result = math.addInt(x: 3, y: 5)
        
        XCTAssertEqual(result, 13)
    }
    func testMultiplyFunc(){
        let result = math.multiplyInt(x: 2, y: 4)
        
        XCTAssertEqual(result, 8)
    }
    func testDivideFunc(){
        let result = math.divideInt(x: 8, y: 2)
        
        XCTAssertEqual(result, 4)
    }
}
