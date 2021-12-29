//
//  FilterViewController.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import UIKit
import GPUImage
import RxRelay
import RxSwift
import RxCocoa

class FilterViewController: BaseViewController {
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var testImage: UIImageView!
    var FilterViewMode = FilterViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToImageFilter(operation:EmbossFilter())
        subscribeToImage()
        bindToCollectionView()
        filterSelected()
    }
    

    func bindToCollectionView() {
        FilterViewMode.FilterObjectsObservable
            .bind(to:self.filterCollectionView
                .rx
                .items(cellIdentifier: String(describing:FilterCollectionViewCell.self), cellType: FilterCollectionViewCell.self)) { row, data, cell in
            
            cell.config(filterName: data.FilterName)
        }.disposed(by: self.disposeBag)
    }
    
    func bindToImageFilter(operation:BasicOperation) {
        FilterViewMode.applyFilter( operation: operation)
        
    }
    
    func subscribeToImage() {
        FilterViewMode.filterImage
            .bind(to: testImage.rx.image)
            .disposed(by: self.disposeBag)
    }
    
    func filterSelected() {
        
        self.filterCollectionView.rx.itemSelected.subscribe {[weak self] index in
            if index.element?.row == 0 {
                self?.FilterViewMode.applyFilter(operation: Filter().EmbossFilters)
            }else if index.element?.row  == 1 {
                self?.FilterViewMode.applyFilter(operation:  Filter().SwirlDistortionFilter)
            }
            else if index.element?.row  == 2 {
                self?.FilterViewMode.applyFilter(operation:  Filter().PolarPixellateFilters)
            }
            else {
                self?.FilterViewMode.applyFilter(operation:  Filter().Halftoneilter)
            }
        } .disposed(by: self.disposeBag)

    }

}



