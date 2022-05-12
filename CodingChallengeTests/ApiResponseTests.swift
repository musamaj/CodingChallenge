//
//  ApiResponseTests.swift
//  NewsReaderTests
//
//  Created by Usama Jamil on 07/03/2022.
//

import XCTest
@testable import CodingChallenge

class ApiResponseTests: XCTestCase {
    
    var sut: Photos!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        try givenSUTFromJSON()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    
    // MARK: - Type Tests
    func testConformsToDecodable() {
        XCTAssertTrue((sut as Any) is Decodable) 
    }
    
    func testDecodableSetsPaginationData() {
        XCTAssertEqual(sut.count, 30)
    }

    func testDecodableSetsTitle() {
        XCTAssertEqual(sut[0].author, "Alejandro Escamilla")
    }

    func testDecodableSetsSource() {
        XCTAssertEqual(sut[0].url, "https://unsplash.com/photos/yC-Yzbqy7PY")
    }
    
    func testDecodableSetsDate() {
        XCTAssertEqual(sut[0].downloadURL, "https://picsum.photos/id/0/5616/3744")
    }
    
    private func givenSUTFromJSON() throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: "data")
        let launchResponse = try decoder.decode(Photos.self, from: data)
        sut = launchResponse
    }
}
