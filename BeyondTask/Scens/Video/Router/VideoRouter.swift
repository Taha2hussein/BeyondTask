//
//  DetailedRouter.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//


import UIKit

class VideoRouter{
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView:UIViewController?
    
    private func createViewController() -> UIViewController {
        let view = UIStoryboard.init(name: Storyboards.video.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewController.filterVideo.rawValue) as? VideoViewController
        
        return view!
    }


    func setSourceView(_ sourceView:UIViewController?){
        guard let view = sourceView else {fatalError("Error Desconocido")}
        self.sourceView = view
    }

}
