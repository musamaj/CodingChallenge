//
//  GalleryCoordinator.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 09/05/2022.
//

import Foundation
import UIKit
import RxSwift

protocol GalleryCoordinatorType: Coordinator<ResultType<Void>> {
    
    var root: UINavigationController! { get }
}

class GalleryCoordinator: Coordinator<ResultType<Void>>, GalleryCoordinatorType {
    
    //MARK: Properties
    
    var root: UINavigationController!
    private var result = PublishSubject<ResultType<Void>>()
    private let window: UIWindow
    
    
    //MARK: Init

    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<ResultType<Void>> {
        
        let viewModel: GalleryViewModelType = GalleryViewModel()
        let mainVC = GalleryController(viewModel: viewModel)
        root = UINavigationController(rootViewController: mainVC)
    
        root.interactivePopGestureRecognizer?.isEnabled = false
        //root.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //root.navigationBar.shadowImage = UIImage()
        //root.navigationBar.isTranslucent = true
        root.navigationBar.tintColor = .primary
        root.navigationBar.isHidden = false
        
        self.window.rootViewController = self.root
        self.window.makeKeyAndVisible()
        
        viewModel.outputs.cellSelection.subscribe { [weak self] event in
            guard let self = self else {return}
            if let photo = event.element {
                self.navigateToPhoto(photo: photo)
            }
        }.disposed(by: disposeBag)
        
        
        return result
    }
    
    func navigateToPhoto(photo: String?) {
        let detailVM = PhotoViewModel(photo: photo)
        let viewController = PhotoController(viewModel: detailVM)
        //root.pushViewController(viewController, animated: true)
        viewController.modalPresentationStyle = .popover
        root.present(viewController, animated: true, completion: nil)
    }
}
