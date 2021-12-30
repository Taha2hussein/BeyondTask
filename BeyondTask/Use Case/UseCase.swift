//
//  UseCase.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import GPUImage
import UIKit


protocol SmoothFilter {
    func applyFilter( operation: BasicOperation)
}

protocol selectVideoProtocol {
    func selectVideo()
}

protocol pushVideoFilter{
    func pushView()
}

protocol ApplyFilter {
    func applyFilter( operation: BasicOperation)
}

protocol BlueFilter {
    func applyFilter(image:UIImage ,  operation: BasicOperation)
}
