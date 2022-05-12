//
//  PhotoViewModel.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 10/05/2022.
//

import Foundation
import RxSwift


//MARK: Inputs
protocol PhotoViewModelInputs {
}

//MARK: Outputs
protocol PhotoViewModelOutputs {
    var photo: Observable<String?> {get}
}

protocol PhotoViewModelType {
    var inputs: PhotoViewModelInputs { get }
    var outputs: PhotoViewModelOutputs { get }
}

public class PhotoViewModel: NSObject, PhotoViewModelType, PhotoViewModelInputs, PhotoViewModelOutputs {
    
    //MARK: Subjects
    
    var photoSubject = BehaviorSubject<String?>(value: nil)
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    var inputs: PhotoViewModelInputs { return self }
    var outputs: PhotoViewModelOutputs { return self }
    
    
    // MARK: - Observer/Observables
    var photo: Observable<String?> { return photoSubject.asObservable() }
    
    
    // MARK: - Init
    
    init(photo: String?) {
        photoSubject.onNext(photo)
    }
    
}

