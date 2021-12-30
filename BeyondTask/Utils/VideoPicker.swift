//
//  VideoPicker.swift
//  BeyondTask
//
//  Created by A on 30/12/2021.
//

import UIKit
import AVFoundation
import AVKit


class SelectedVideoViewController: KeyboardViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    let imagePickerController = UIImagePickerController()
    var videoURL: NSURL?
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.movie" , "public.image"]
        
    }
    
    func openGallery() {
        self.present(imagePickerController, animated: true, completion: nil)
        
        if let videoURL = videoURL {
            let player = AVPlayer(url: videoURL as URL)
            
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            
            self.present(playerViewController, animated: true){
                playerViewController.player!.play()
            }
        }
    }
    func previewImageFromVideo(url:NSURL) -> UIImage? {
        let asset = AVAsset(url:url as URL)
        let imageGenerator = AVAssetImageGenerator(asset:asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        var time = asset.duration
        time.value = min(time.value,2)
        
        do {
            let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            return nil
        }
    }
    
        @objc func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any])
        {
            imagePickerController.dismiss(animated:true) {
                if let videourl = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
                    let ـ = self.previewImageFromVideo(url: videourl as NSURL)
    
                    self.player = AVPlayer(url: videourl)
                    let playerLayer = AVPlayerLayer(player: self.player)
                    playerLayer.frame = self.view.bounds
                    self.view.layer.addSublayer(playerLayer)
                    self.player.play()
                }
            }
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
}

