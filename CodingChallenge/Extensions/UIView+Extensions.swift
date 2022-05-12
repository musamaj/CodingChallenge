//
//  UIView+Extensions.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: View animations

public enum ViewAnimationType {
    case bounce
}

public extension UIView {
    func bounce() {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 0.08
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.isRemovedOnCompletion = true
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.1, 1.1, 1.0))
        layer.add(animation, forKey: nil)
    }

    fileprivate func animate(withType type: ViewAnimationType) {
        switch type {
        case .bounce:
            bounce()
        }
    }
}

public extension UIView {
    var centerInWindow: CGPoint {
        superview?.convert(center, to: nil) ?? .zero
    }
}

public extension UIView{
    var globalPoint :CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }

    var globalFrame :CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
}

public extension UIView {
    var globalFrameNew: CGRect? {
        let rootView = UIApplication.shared.keyWindow?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}

public extension Reactive where Base: UIView {
    var animate: Binder<ViewAnimationType> {
        return Binder(self.base) { view, animation -> Void in
            view.animate(withType: animation)
        }
    }
}

// MARK: View Reactive

public extension Reactive where Base: UIView {
    var endEditting: Binder<Bool> {
        return Binder(base) { view, end in
            _ = view.endEditing(end)
        }
    }
}

// MARK: Animate hidden
public extension UIView {
    func animateIsHidden(_ hidden: Bool) {
        guard hidden != isHidden else { return }
        let newAlpha = alpha
        if !hidden {
            alpha = 0
            isHidden = false
        }
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.alpha = hidden ? 0 : newAlpha
        }) { [unowned self] (completed) in
            if completed {
                self.isHidden = hidden
                self.alpha = newAlpha
            }
        }
    }
}

public extension Reactive where Base: UIView {
    var animateIsHidden: Binder<Bool> {
        return Binder(base) { view, hidden in
            view.animateIsHidden(hidden)
        }
    }
}

// MARK: - UIView + Gradient
enum LayerName: String {
    case gradient = "gradient"
}

public extension UIView {
    func setGradientBackground(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = LayerName.gradient.rawValue
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func removeGradientBackground() {
        self.layer.sublayers?.filter { $0.name == LayerName.gradient.rawValue }.first?.removeFromSuperlayer()
    }
}

// MARK: Reusable view
public protocol ReusableView: AnyObject {}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: Rounded view

public extension UIView {
    func roundView(withBorderColor color: UIColor? = nil, withBorderWidth width: CGFloat? = nil) {
        layer.cornerRadius = bounds.height/2
        layer.borderWidth = width ?? 0
        layer.borderColor = color?.cgColor ?? UIColor.clear.cgColor
        layer.masksToBounds = false
        clipsToBounds = true
    }
}

// MARK: View + rounded corners

public extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        clipsToBounds = true
    }
}

// MARK: View + Shimmer layer

public extension UIView {
    var isShimmerOn: Bool {
        get { return shimmerable }
        set { shimmerable = newValue
            newValue ? startShimmeringEffect() : stopShimmeringEffect()
        }
    }

    private var shimmerable: Bool {
        get { return objc_getAssociatedObject(self, "pkey") as? Bool ?? false }
        set { objc_setAssociatedObject(self, "pkey", newValue, objc_AssociationPolicy(rawValue: 1)!) }
    }
    
    private  func removeShimmerLayer(){
        layer.mask = nil
    }
    
   
    func startShimmeringEffect() {
        let light = UIColor.greyLight.cgColor
        let alpha = UIColor.grey.cgColor
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width:self.bounds.size.width, height: self.bounds.size.height)
        gradient.colors = [light, alpha, alpha, light]
        gradient.startPoint = CGPoint(x: 0.0, y: 1)
        gradient.endPoint = CGPoint(x: 1.0,y: 1)
        gradient.locations = [0.0, 0.3, 0.5, 1]
        
        gradient.cornerRadius = 5
        gradient.masksToBounds = true
        
        self.layer.addSublayer(gradient)
        clipsToBounds = true
        
        let animation = CABasicAnimation(keyPath: "locations")
        
        animation.fromValue = [-1, -0.3, -0.5, 0]
        animation.toValue = [1.0, 1.3, 1.5, 2]
        animation.duration = 1.7
        animation.repeatCount = .infinity
        
        gradient.add(animation, forKey: "shimmer")
    
        addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
        
    }
    func stopShimmeringEffect() {
        if let gradientLayer =  self.layer.sublayers?.first(where: { (layer) -> Bool in
            return layer.isKind(of: CAGradientLayer.self)
        })
        {
            gradientLayer.removeFromSuperlayer()
        }
        layer.mask = nil
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if let gradientLayer =  self.layer.sublayers?.first(where: { (layer) -> Bool in
            return layer.isKind(of: CAGradientLayer.self)
        })
        {
            gradientLayer.frame = CGRect(x:0 , y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        }
    }
}

extension Reactive where Base: UIView {
    /// Bindable sink for `isShimmerOn` property.
    public var isShimmerOn: Binder<Bool> {
        return Binder(self.base) { view, shimmering in
            view.isShimmerOn = shimmering
        }
    }
}

public extension UIView {
    func layoutAllSuperViews() {
        if let view = superview {
            view.layoutAllSuperViews()
        }
        layoutSubviews()
    }
    
    func layoutAllSubviews() {
        subviews.forEach{ $0.layoutAllSubviews() }
        layoutSubviews()
    }
}
