//
//  VideoViewController.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay
import AVKit
import AVFoundation
import GPUImage

class VideoViewController: VideoPicker_Filter {
    
    var VideoViewModelInstance = VideoViewModel()
    private var router = VideoRouter()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectVideoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewControllerRouter()
        selectVideo()
        bindToSelectedVideoImagePreview()
        
    }

    func bindViewControllerRouter() {
        VideoViewModelInstance.bind(view: self, router: router)
    }

    func selectVideo() {
        selectVideoBtn.rx.tap.subscribe {[weak self] _ in
            self?.openGallery()
        } .disposed(by: self.disposeBag)
    }
    
    func bindToSelectedVideoImagePreview() {
        VideoViewModelInstance.selectedVideImagePreview
            .bind(to: imageView.rx.image)
            .disposed(by: self.disposeBag)
    }
}
