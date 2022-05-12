//
//  NewsItemCellViewModel.swift
//  NewsReader
//
//  Created by Usama Jamil on 05/03/2022.
//

import Foundation
import RxSwift
import Kingfisher


// MARK: - Inputs

protocol PhotoCellViewModelInputs {
    var imageUrlObserver: AnyObserver<String?> {get}
}


// MARK: - Outputs

protocol PhotoCellViewModelOutputs {
    var imageUrl: Observable<String?> {get}
}

protocol PhotoCellViewModelType {
    var inputs: PhotoCellViewModelInputs { get }
    var outputs: PhotoCellViewModelOutputs { get }
}

class PhotoCellViewModel: PhotoCellViewModelType, PhotoCellViewModelInputs, PhotoCellViewModelOutputs, ReusableCollectionViewCellViewModelType {
    
    
    // MARK: - Properties
    
    var inputs: PhotoCellViewModelInputs { return self}
    var outputs: PhotoCellViewModelOutputs { return self }
    var reusableIdentifier: String { return PhotoCell.reuseIdentifier }
    
    // MARK: - Subjects
    
    var imageUrlSubject = BehaviorSubject<String?>(value: nil)
    
    // MARK: - Observer/Observables
        
    var imageUrl: Observable<String?> { return imageUrlSubject.asObservable() }
    var imageUrlObserver: AnyObserver<String?> { return imageUrlSubject.asObserver() }

    private var photoDetails: Photo
    
    
    init(detail: Photo) {
        self.photoDetails = detail
        imageUrlSubject.onNext(detail.downloadURL)
    }
}
