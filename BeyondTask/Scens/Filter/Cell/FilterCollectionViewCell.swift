//
//  FilterCollectionViewCell.swift
//  BeyondTask
//
//  Created by A on 31/12/2021.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filterLabel: UILabel!
    
    func config(filterName: String) {
        filterLabel.text = filterName
    }
}
