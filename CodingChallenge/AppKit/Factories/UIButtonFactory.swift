//
//  UIButtonFactory.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

public class UIButtonFactory {
    
    public class func createButton(title: String = String(), backgroundColor: UIColor = UIColor.appColor(ofType: .primaryDark), textColor: UIColor =  UIColor.appColor(ofType: .primary)) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}


public extension Reactive where Base: UIButton {
    var logEvent: ControlEvent<Void> { return self.base.rx.tap }
}
