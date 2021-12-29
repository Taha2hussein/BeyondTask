//
//  FilterCollectionViewCell.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filterBtn: UIButton!
    
    func config(filterName:String) {
        self.filterBtn.setTitle(filterName, for: .normal)
    }
}
