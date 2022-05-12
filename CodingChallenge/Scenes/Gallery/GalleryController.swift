//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 07/05/2022.
//

import UIKit
import RxSwift
import RxDataSources

class GalleryController: UIViewController, UICollectionViewDelegate {

    //MARK: UI Controls
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    //MARK: Properties
    
    
    private var disposeBag = DisposeBag()
    private var viewModel : GalleryViewModelType!
    
    private var dataSource: RxCollectionViewSectionedReloadDataSource<SectionModel<Int, ReusableCollectionViewCellViewModelType>>!
    
    
    //MARK: Init
    
    
    init(viewModel: GalleryViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Gallery"
        self.view.backgroundColor = .white
        viewModel.inputs.fetchObserver.onNext(())
        
        setupViews()
        setConstraints()
        configureCollectionView()
        bindCollectionView()
    }
    
    func setupViews() {
        self.view.addSubview(collectionView)
    }
    
    func setConstraints() {
        collectionView.alignEdgesWithSuperview([.left, .right, .top, .bottom], constants: [15, 15, 15, 15])
    }
    
    func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
    }
    
    func bindCollectionView() {
        
        dataSource = RxCollectionViewSectionedReloadDataSource(configureCell: { (_, collectionView, indexPath, viewModel) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reusableIdentifier, for: indexPath) as! RxUICollectionViewCell
            cell.configure(with: viewModel)
            return cell
        })
        
        viewModel.outputs.dataSource.bind(to: collectionView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(ReusableCollectionViewCellViewModelType.self).filter { $0 is PhotoCellViewModel }.flatMap {
            ($0 as! PhotoCellViewModel).outputs.imageUrl
        }.bind(to: viewModel.inputs.cellSelectionObserver).disposed(by: disposeBag)
        
        collectionView.rx.willDisplayCell.subscribe { [weak self] event in
            guard let self = self else {return}
            if event.element?.at.row == self.collectionView.numberOfItems(inSection: 0)-1 {
                self.viewModel.inputs.fetchObserver.onNext(())
            }
        }.disposed(by: disposeBag)
    }

}

extension GalleryController: UICollectionViewDelegateFlowLayout {
   
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3)-20, height: (view.frame.width/3)-20)
    }
    
}
