//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Hatice Taşdemir on 10.11.2024.
//

import XCTest

final class TestingUITests: XCTestCase {

    /*override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }*/

    func testtoDoItem() throws {
        // UI tests must launch the application that they test. uygulamayı başlatan kod
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
            
                        
        //tanımlama işlemini yaparken hazır araçtan yararlanırız:recorduıtest yapmak istenilen testi kayıt eder. bu kodlar addedcelli görmeyi test eder
        
        
       let addButton = app.navigationBars["Testing.View"].buttons["Add"]
        
        let app2 = app
        let textField = app2.alerts["Add item"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = app.alerts["Add item"].scrollViews.otherElements.buttons["ok"]
        let addedCell = app2.tables/*@START_MENU_TOKEN@*/.staticTexts["hatice go to shopp..."]/*[[".cells.staticTexts[\"hatice go to shopp...\"]",".staticTexts[\"hatice go to shopp...\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
       
        addButton.tap()
        textField.tap()
        textField.typeText("hatice go to shopp...")
        okButton.tap()
        
        XCTAssertTrue(addedCell.exists) 
        
                
    }
    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()
                                        
        
        let addButton = app.navigationBars["Testing.View"].buttons["Add"]
         
         let app2 = app
         let textField = app2.alerts["Add item"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
         let okButton = app.alerts["Add item"].scrollViews.otherElements.buttons["ok"]
         let addedCell = app2.tables/*@START_MENU_TOKEN@*/.staticTexts["hatice go to shopp..."]/*[[".cells.staticTexts[\"hatice go to shopp...\"]",".staticTexts[\"hatice go to shopp...\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //tables
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
         addButton.tap()
         textField.tap()
         textField.typeText("hatice go to shopp...")
         okButton.tap()
        
       
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
        
      
      
                                
                
      
        
    }
    

    /* func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }*/
}
