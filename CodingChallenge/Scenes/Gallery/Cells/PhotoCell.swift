//
//  NewsItemCell.swift
//  NewsReader
//
//  Created by Usama Jamil on 05/03/2022.
//

import Foundation
import UIKit
import Kingfisher


class NewsItemCell: RxUITableViewCell {
    
    
    // MARK: - UI Control
    
    lazy var newsTitleLbl: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .large, weight: .medium, text:  "")
    lazy var newsDescLbl: UILabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .large, numberOfLines: 2, text:  "")
    lazy var newsImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill, image: nil, tintColor: .clear)
    lazy var timeLbl: UILabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .large, text:  "")
    
    
    // MARK: - Properties
    
    var viewModel: PhotoCellViewModelType!
    
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        self.contentView.addSubview(newsImage)
        self.contentView.addSubview(newsTitleLbl)
        self.contentView.addSubview(newsDescLbl)
        self.contentView.addSubview(timeLbl)
    }
    
    func setupConstraints() {
        newsImage
        .width(constant: 70)
        .height(constant: 70)
        .alignEdgesWithSuperview([.left, .top], constants: [20, 10])
        
        timeLbl
        .width(constant: 60)
        .height(constant: 25)
        .alignEdgesWithSuperview([.right, .top], constants: [20, 10])
        
        newsTitleLbl
        .toRightOf(newsImage, constant: 15)
        .toLeftOf(timeLbl, constant: 15)
        .alignEdgeWithSuperview(.top, constant: 10)
        
        newsDescLbl
        .toRightOf(newsImage, constant: 15)
        .toLeftOf(timeLbl, constant: 15)
        .toBottomOf(newsTitleLbl, constant: 10)
        .alignEdgeWithSuperview(.bottom, constant: 10)
    }
    
    func bind() {
        viewModel.outputs.imageUrl.subscribe({ [weak self] event in
            let url = URL(string: event.element ?? "")
            self?.newsImage.kf.setImage(with: url)
        }).disposed(by: disposeBag)
    }
}
