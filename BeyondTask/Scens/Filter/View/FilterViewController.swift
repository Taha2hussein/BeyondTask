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

class FilterViewController: BaseViewController  {
    
    @IBOutlet weak var navigateBtn: UIButton!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var testImage: UIImageView!
    
    var FilterViewMode = FilterViewModel()
    private var router = FilterRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        bindViewControllerRouter()
        bindToImageFilter(operation: Filter().EmbossFilters)
        subscribeToImage()
        bindToCollectionView()
        filterSelected()
        pushNextScreen()
    }

    func setUP() {
        filterCollectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
    }
    
    func pushNextScreen() {
        navigateBtn.rx.tap.subscribe {[weak self] _ in
            self?.showVideoViewController()
        } .disposed(by: self.disposeBag)
    }
    
    private func showVideoViewController() {
        FilterViewMode.pushView()
    }
}

// Collection view
extension FilterViewController {
    
    func bindToCollectionView() {
        FilterViewMode.FilterObjectsObservable
            .bind(to:self.filterCollectionView
                    .rx
                    .items(cellIdentifier: String(describing:FilterCollectionViewCell.self), cellType: FilterCollectionViewCell.self)) { _, data, cell in
                
                cell.config(filterName: data.FilterName)
            }.disposed(by: self.disposeBag)
    }
    
    func filterSelected() {
        
        Observable.zip(filterCollectionView
                        .rx
                        .itemSelected,filterCollectionView.rx.modelSelected(FullFilter.self)).bind { [weak self] selectedIndex, sclectedFilter in
            self?.FilterViewMode.applyFilter(operation: sclectedFilter.filter)
        }
            .disposed(by: self.disposeBag)
    }
    
}

extension FilterViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 100, height: 60)
       }
}

// subcribers


extension FilterViewController {
    
    func bindViewControllerRouter(){
        FilterViewMode.bind(view: self, router: router)
    }
    
    
    
    func bindToImageFilter(operation:BasicOperation) {
        FilterViewMode.applyFilter( operation: operation)
        
    }
    
    func subscribeToImage() {
        FilterViewMode.filterImage
            .bind(to: testImage.rx.image)
            .disposed(by: self.disposeBag)
    }
}
