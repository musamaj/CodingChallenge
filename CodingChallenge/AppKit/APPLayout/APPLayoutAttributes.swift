//
//  APPLayoutAttributes.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import Foundation
import UIKit

enum APPLayoutAxis {
    case vertical
    case horizontal
    case dimensions
}

public enum APPLayoutEdge {
    case left
    case right
    case top
    case bottom
    case bottomAvoidingKeyboard
    case safeAreaLeft
    case safeAreaRight
    case safeAreaTop
    case safeAreaBottom
    case safeAreaBottomAvoidingKeyboard
    case centerX
    case centerY
    case height
    case width
}

extension APPLayoutEdge {
    var axis: APPLayoutAxis {
        switch self {
        case .left, .right, .centerX, .safeAreaLeft, .safeAreaRight:
            return .horizontal
        case .bottom, .top, .centerY, .safeAreaTop, .safeAreaBottom, .bottomAvoidingKeyboard, .safeAreaBottomAvoidingKeyboard:
            return .vertical
        case .height, .width:
            return .dimensions
            
        }
    }
    
    var safeAreaEdge: APPLayoutEdge {
        switch self {
        case .left, .safeAreaLeft:
            return .safeAreaLeft
        case .top, .safeAreaTop:
            return .safeAreaTop
        case .right, .safeAreaRight:
            return .safeAreaRight
        case .bottom, .safeAreaBottom, .bottomAvoidingKeyboard, .safeAreaBottomAvoidingKeyboard:
            return .safeAreaBottom
        default:
            return .safeAreaLeft
        }
    }
}

public enum APPLayoutConstantModifier {
    case equalTo
    case lessThanOrEqualTo
    case greaterThanOrEqualTo
}

internal extension UIView {
    func horizontalAnchor(_ edge: APPLayoutEdge) -> NSLayoutXAxisAnchor {
        switch edge {
        case .left:
            return leadingAnchor
        case .right:
            return trailingAnchor
        case .centerX:
            return centerXAnchor
        case .safeAreaLeft:
            return safeAreaLayoutGuide.leadingAnchor
        case .safeAreaRight:
            return safeAreaLayoutGuide.trailingAnchor
        default:
            return leadingAnchor
        }
    }
    
    func verticalAnchor(_ edge: APPLayoutEdge) -> NSLayoutYAxisAnchor {
        switch edge {
        case .top:
            return topAnchor
        case .bottom, .bottomAvoidingKeyboard:
            return bottomAnchor
        case .centerY:
            return centerYAnchor
        case .safeAreaTop:
            return safeAreaLayoutGuide.topAnchor
        case .safeAreaBottom, .safeAreaBottomAvoidingKeyboard:
            return safeAreaLayoutGuide.bottomAnchor
        default:
            return topAnchor
        }
    }
    
    func dimensionAnchor(_ edge: APPLayoutEdge) -> NSLayoutDimension {
        switch edge {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        default:
            return widthAnchor
        }
    }
}
