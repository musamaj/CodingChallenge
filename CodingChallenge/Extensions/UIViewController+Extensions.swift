//
//  UIViewController+Extensions.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import UIKit

extension UIViewController {
    public func hideBackButton() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
    }
    
    public func addBackButton() {
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.setTitle("< Back", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(onTapBackButton), for: .touchUpInside)
        
        let backButton = UIBarButtonItem()
        backButton.customView = button
        navigationItem.leftBarButtonItem  = backButton
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    public func addBackButtonWithOutNavBar() {
        
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 44, width: 32, height: 32)
        button.setTitle("Back", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(onTapBackButton), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
    @objc open func onTapBackButton() {
        fatalError("Add back action in viewController")
    }
}
