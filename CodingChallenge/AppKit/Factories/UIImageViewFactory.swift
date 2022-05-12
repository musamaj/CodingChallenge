//
//  UIImageViewFactory.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import Foundation
import UIKit

public class UIImageViewFactory {
    
    public class func createBackgroundImageView(mode: UIImageView.ContentMode = .scaleAspectFill, image: UIImage = UIImage(named: "image_backgound")!) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = mode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
    
    public class func createImageView(mode: UIImageView.ContentMode = .scaleAspectFill, image: UIImage? = nil, tintColor: UIColor = .clear) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = mode
        imageView.tintColor = tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
    
    public class func createGifImageView(mode: UIImageView.ContentMode = .scaleAspectFill, image: UIImage? = nil, tintColor: UIColor = .clear) -> GifImageView {
        let imageView = GifImageView()
        imageView.contentMode = mode
        imageView.tintColor = tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }
}

public class GifImageView: UIImageView{
    
}
