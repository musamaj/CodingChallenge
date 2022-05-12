//
//  RxUICollectionViewCell.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 10/05/2022.
//

import UIKit
import RxSwift

open class RxUICollectionViewCell: UICollectionViewCell, ReusableView {
    
    private(set) public var disposeBag = DisposeBag()
    public var indexPath: IndexPath!
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    open func configure(with viewModel: Any) {
        fatalError("Configure with viewModel must be implemented.")
    }
    
}
