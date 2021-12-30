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
import SwiftUI

class VideoPicker_Filter: SelectedVideoViewController {
    
    var startPlayer = BehaviorRelay<Bool>(value: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeerToTakeScreen(second:15)
    }
    
    func timeerToTakeScreen(second:Int) {
        Observable<Int>
            .interval(.seconds(second),  scheduler: SerialDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] timer in
                print(timer)
                (self?.player.timeControlStatus == .playing) ? self?.takeScreen() : ()
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
                self.applyFilter(image: image, operation: filter)
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


extension VideoPicker_Filter: BlueFilter {
    func applyFilter(image: UIImage, operation: OperationGroup) {

        let filteredImage = image.filterWithOperation(operation)
        writeImage(image:filteredImage)
    }
    
    
}
