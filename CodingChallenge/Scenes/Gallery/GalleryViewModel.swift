//
//  GalleryViewModel.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 09/05/2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

//MARK: Inputs
protocol GalleryViewModelInputs {
    var fetchObserver: AnyObserver<Void> {get}
    var cellSelectionObserver: AnyObserver<String?> {get}
}

//MARK: Outputs
protocol GalleryViewModelOutputs {
    var fetchData: Observable<Void> {get}
    var dataSource: Observable<[SectionModel<Int, ReusableCollectionViewCellViewModelType>]> { get }
    var cellSelection: Observable<String?> {get}
}

protocol GalleryViewModelType {
    var inputs: GalleryViewModelInputs { get }
    var outputs: GalleryViewModelOutputs { get }
}

public class GalleryViewModel: NSObject, GalleryViewModelType, GalleryViewModelInputs, GalleryViewModelOutputs {
    
    //MARK: Subjects
    
    private let fetchDataSubject = PublishSubject<Void>()
    private let cellSelectionSubject = PublishSubject<String?>()
    private let dataSourceSubject = BehaviorSubject<[SectionModel<Int, ReusableCollectionViewCellViewModelType>]>(value: [])
    
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    var inputs: GalleryViewModelInputs { return self }
    var outputs: GalleryViewModelOutputs { return self }
    private let apiClient = WebAPIClient()
    
    public var dataSource: Observable<[SectionModel<Int, ReusableCollectionViewCellViewModelType>]> { return dataSourceSubject.asObservable() }
    private var photosList = [Photo]()
    private var vmsList  = [ReusableCollectionViewCellViewModelType]()
    
    private var repository : ApiRepository { ApiRepository(client: WebAPIClient())}
    private var page = 1
    
    
    // MARK: - Observer/Observables
    
    var fetchData: Observable<Void> { return fetchDataSubject.asObservable() }
    var fetchObserver: AnyObserver<Void> { return fetchDataSubject.asObserver()}
    var cellSelection: Observable<String?> { return cellSelectionSubject.asObservable() }
    var cellSelectionObserver: AnyObserver<String?> { return cellSelectionSubject.asObserver() }
    
    
    // MARK: - Init
    
    override init() {
        super.init()
        fetchDataSubject.asObservable()
            .map { PhotosRequest(page: self.page) }
            .flatMapLatest { [unowned self] request -> Observable<Photos> in
                return self.repository.fetchNews(apiRequest: request)
            }.subscribe({ [weak self] event in
                guard let self = self else {return}
                if let element = event.element {
                    self.photosList.append(contentsOf: element)
                    self.generateViewModels(photosCollection: self.photosList)
                    self.page += 1
                }
            })
            .disposed(by: disposeBag)
    }
    
    func generateViewModels(photosCollection: Photos) {
        vmsList.removeAll()
        for photo in photosCollection {
            let newsVM = PhotoCellViewModel(detail: photo)
            vmsList.append(newsVM)
        }
        dataSourceSubject.onNext([SectionModel.init(model: 0, items: vmsList)])
    }
}

