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
    
    // Save image
    func writeImage(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.finishWriteImage), nil)
    }

    @objc private func finishWriteImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if (error != nil) {
            // Something wrong happened.
            print("error occurred: \(String(describing: error))")
        } else {
            // Everything is alright.
            print("saved success!")
        }
    }
    
    deinit{
        print("Details Deallocated")
    }
}

extension VideoViewModel: BlueFilter {
    func applyFilter(image: UIImage, operation: BasicOperation) {
        if let filteredImage = image.filterWithOperation(operation) as? UIImage{
        writeImage(image: filteredImage)
        }
    }
    
   
}
 
