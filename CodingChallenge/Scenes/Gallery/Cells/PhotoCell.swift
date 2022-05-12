//
//  NewsItemCell.swift
//  NewsReader
//
//  Created by Usama Jamil on 05/03/2022.
//

import Foundation
import UIKit
import Kingfisher


class PhotoCell: RxUICollectionViewCell {
    
    
    // MARK: - UI Control
    
    lazy var galleryImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill, image: nil, tintColor: .clear)
    
    
    // MARK: - Properties
    
    private var viewModel: PhotoCellViewModelType!
    
    
    // MARK: Initialization
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //render()
    }
    
    private func commonInit() {
        setupViews()
        setupConstraints()
    }
    
    // MARK: Configuration
    
    override public func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? PhotoCellViewModelType else { return }
        self.viewModel = viewModel
        bind()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Setup methods
    
    func setupViews() {
        self.contentView.addSubview(galleryImage)
    }
    
    func setupConstraints() {
        galleryImage
            .alignEdgesWithSuperview([.left, .top, .right, .bottom], constants: [0, 0, 0, 0])
        
    }
    
    func bind() {
        
        viewModel.outputs.imageUrl.subscribe { [weak self] event in
            
            guard let self = self else {return}
            let processor = DownsamplingImageProcessor(size: CGSize.init(width: 100, height: 100))
            |> RoundCornerImageProcessor(cornerRadius: 8)
            
            if let imgUrl = event.element {
                guard let url = URL.init(string: imgUrl ?? "") else {
                    return
                }
                let resource = ImageResource(downloadURL: url)
                
                self.galleryImage.kf.indicatorType = .activity
                self.galleryImage.kf.setImage(
                    with: resource,
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ], completionHandler:
                        {
                            result in
                            switch result {
                            case .success(_): break
                            case .failure(let error):
                                print("Job failed: \(error.localizedDescription)")
                            }
                        })
            }
        }.disposed(by: disposeBag)
    }
    
}
