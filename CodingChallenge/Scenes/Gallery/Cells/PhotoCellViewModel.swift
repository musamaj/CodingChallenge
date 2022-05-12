//
//  NewsItemCellViewModel.swift
//  NewsReader
//
//  Created by Usama Jamil on 05/03/2022.
//

import Foundation
import RxSwift


// MARK: - Inputs

protocol PhotoCellViewModelInputs {
    var imageUrlObserver: AnyObserver<String> {get}
}


// MARK: - Outputs

protocol PhotoCellViewModelOutputs {
    var imageUrl: Observable<String> {get}
}

protocol PhotoCellViewModelType {
    var inputs: PhotoCellViewModelInputs { get }
    var outputs: PhotoCellViewModelOutputs { get }
}

class PhotoCellViewModel: PhotoCellViewModelType, PhotoCellViewModelInputs, PhotoCellViewModelOutputs, ReusableTableViewCellViewModelType {
    
    
    // MARK: - Properties
    
    var inputs: PhotoCellViewModelInputs { return self}
    var outputs: PhotoCellViewModelOutputs { return self }
    var reusableIdentifier: String { return NewsItemCell.reuseIdentifier }
    
    // MARK: - Subjects
    
    var imageSubject : BehaviorSubject<String>
    
    // MARK: - Observer/Observables
    
    var imageUrl: Observable<String> { return imageSubject.asObservable() }
    var imageUrlObserver: AnyObserver<String> { return imageSubject.asObserver() }

    var photoDetails: Photo
    
    
    init(detail: Photo) {
        self.photoDetails = detail
        imageSubject = BehaviorSubject<String>(value: detail.downloadURL ?? "")
    }

    
}
