//
//  VideoPicker+Filter.swift
//  BeyondTask
//
//  Created by A on 30/12/2021.
//

import UIKit
import RxRelay
import RxCocoa
import RxSwift
import AVFoundation
import AVKit
import GPUImage
class VideoPicker_Filter: SelectedVideoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeerToTakeScreen()
    }
    
    func timeerToTakeScreen() {
        Observable<Int>.interval(.seconds(10), scheduler: MainScheduler.instance)
            .subscribe(onNext: {[weak self] timer in
                print(timer)
                self?.takeScreen()
            })
            .disposed(by: disposeBag)
    }
    
    func takeScreen(){
        if let item = player.currentItem {
            let imageGenerator = AVAssetImageGenerator(asset: item.asset)
            imageGenerator.appliesPreferredTrackTransform = true
            if let cgImage = try? imageGenerator.copyCGImage(at: item.currentTime(), actualTime: nil) {
                let image = UIImage(cgImage: cgImage)
                let filter = SmoothToonFilter()
                let filteredImage = image.filterWithOperation(filter)
                writeImage(image:filteredImage)
            }
        }
    }
    
    func writeImage(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.finishWriteImage), nil)
    }
    
    @objc private func finishWriteImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if (error != nil) {
            print("error occurred: \(String(describing: error))")
        } else {
            print("saved success!")
        }
    }
}
