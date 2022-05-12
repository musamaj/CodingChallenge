//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Usama Jamil on 07/05/2022.
//

import XCTest
import RxSwift
@testable import CodingChallenge

class CodingChallengeTests: XCTestCase {

    var sut: GalleryViewModelType!
    var controller: GalleryController!    
    
    let disposeBag = DisposeBag()
    
    override func setUpWithError() throws {
        super.setUp()
        
        sut = GalleryViewModel()
        controller = GalleryController(viewModel: sut)
    }
    
    func testApiFetching() {
        
        let expectation = self.expectation(description: "fetched")
        
        sut.inputs.fetchObserver.onNext(())
        sut.outputs.dataSource.subscribe { event in
            expectation.fulfill()
        }.disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testNewsActionOnSetup() {
        controller.setupViews()
        XCTAssertEqual(controller.view.subviews.count, 1)
    }

}
