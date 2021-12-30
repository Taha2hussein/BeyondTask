//
//  VideoViewModel.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import Foundation
import RxCocoa
import RxSwift
import RxRelay
import UIKit
import GPUImage

class VideoViewModel {

    var selectedVideImagePreview = BehaviorRelay<UIImage>(value: UIImage())
    
    var router: VideoRouter?
    private weak var view:VideoViewController?
  
    func bind(view:VideoViewController, router:VideoRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
  
    deinit{
        print("Details Deallocated")
    }
}

