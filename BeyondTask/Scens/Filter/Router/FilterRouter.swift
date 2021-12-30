//
//  ShowRouter.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import UIKit

class FilterRouter{
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController()-> UIViewController {
        let view = UIStoryboard.init(name: Storyboards.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewController.filterView.rawValue)
        
        return view
    }
    
    func setSourceView(_ sourceView:UIViewController?){
        guard let view = sourceView else {fatalError("Error Desconocido")}
        self.sourceView = view
    }
    
    func navigateToVideoView(){
        let videoView = VideoRouter().viewController
        sourceView?.navigationController?.pushViewController(videoView, animated: true)
    }
}


