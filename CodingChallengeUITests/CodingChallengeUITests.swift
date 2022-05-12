//
//  CodingChallengeUITests.swift
//  CodingChallengeUITests
//
//  Created by Usama Jamil on 07/05/2022.
//

import XCTest

class CodingChallengeUITests: XCTestCase {

    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testGalleryCollection() {
        let initialCollectionRows = app.collectionViews.children(matching: .cell).count
        XCTAssert(initialCollectionRows > 0)
    }
    
    func testTapThumbnail() {
        app.collectionViews.children(matching: .cell).element(boundBy:0).tap()
        XCTAssert(app.scrollViews.children(matching: .image).count == 1)
    }
}
