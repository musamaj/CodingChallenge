//
//  PhotoController.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 10/05/2022.
//

import UIKit
import RxSwift
import Kingfisher

class PhotoController: UIViewController {

    // MARK: - UI Control
    
    private lazy var galleryImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill, image: nil, tintColor: .clear)
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    //MARK: Properties
    
    
    var disposeBag = DisposeBag()
    private var viewModel : PhotoViewModelType!
    
    //MARK: Init
    
    
    init(viewModel: PhotoViewModelType) {
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
         
        self.view.backgroundColor = .grey
        scrollView.delegate = self
        setupViews()
        setConstraints()
        bind()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let zoomImage = galleryImage.image {
            setMinZoomScaleForImageSize(zoomImage.size)
        }
    }
    
    private func setMinZoomScaleForImageSize(_ imageSize: CGSize) {
        let widthScale = view.frame.width / imageSize.width
        let heightScale = view.frame.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        // Scale the image down to fit in the view
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
        
        // Set the image frame size after scaling down
        let imageWidth = imageSize.width * minScale
        let imageHeight = imageSize.height * minScale
        let newImageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        galleryImage.frame = newImageFrame
        
        centerImage()
    }
    
    private func centerImage() {
        let imageViewSize = galleryImage.frame.size
        let scrollViewSize = view.frame.size
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    func setupViews() {
        scrollView.addSubview(galleryImage)
        self.view.addSubview(scrollView)
    }
    
    func setConstraints() {
        scrollView.alignEdgesWithSuperview([.left, .right, .top, .bottom], constants: [0,0,50,0])
        galleryImage.alignAllEdgesWithSuperview()
    }
    
    func bind() {
        viewModel.outputs.photo.subscribe({ [weak self] event in
            guard let self = self else {return}
            if let image = event.element {
                let url = URL(string: image ?? "")
                self.galleryImage.kf.setImage(with: url)
            }
        }).disposed(by: disposeBag)
    }

}


extension PhotoController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return galleryImage
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
