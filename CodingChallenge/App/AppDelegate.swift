//
//  AppDelegate.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 07/05/2022.
//

import UIKit
import RxSwift
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()

        if #available(iOS 15, *) {
            window?.backgroundColor = .white
        }
        
        appCoordinate()
            .subscribe()
            .disposed(by: disposeBag)
        
        return true
    }
    
    fileprivate func appCoordinate() -> Observable<ResultType<Void>> {
        appCoordinator = AppCoordinator(window: window!)
        return appCoordinator!.start().flatMap {[unowned self] _ in
            return self.appCoordinate()
        }
    }

}

