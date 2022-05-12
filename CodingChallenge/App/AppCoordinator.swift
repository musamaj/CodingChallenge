//
//  AppCoordinator.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 09/05/2022.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator: Coordinator<ResultType<Void>> {

    private let window: UIWindow
    private let mainResult = PublishSubject<ResultType<Void>>()
    private var result = PublishSubject<ResultType<Void>>()

    init(window: UIWindow) {
        self.window = window
        super.init()

    }
    
    override func start() -> Observable<ResultType<Void>> {
        showMain()
        
        return result
    }
    
    func showMain() {
        coordinate(to: GalleryCoordinator(window: window))
            .subscribe(onNext: { [weak self] result in
                guard let `self` = self else { return }
                self.mainResult.onNext(result)
            })
            .disposed(by: disposeBag)
    }
}
