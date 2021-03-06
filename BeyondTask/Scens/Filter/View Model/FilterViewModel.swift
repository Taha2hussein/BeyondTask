//
//  FilterViewModel.swift
//  BeyondTask
//
//  Created by A on 29/12/2021.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa
import GPUImage
import UIKit

class FilterViewModel {
    
    private weak var view: FilterViewController?
    private var router: FilterRouter?
    var filterImage = BehaviorRelay<UIImage>(value:UIImage())
    private  let filter = Filter()
    private var FilterObjects = BehaviorRelay<[FullFilter]>(value: [])
    var FilterObjectsObservable : BehaviorRelay<[FullFilter]> {
        return FilterObjects
    }
    
    func bind(view:FilterViewController, router:FilterRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    init() {
        
        let Filters = [FullFilter.init(FilterName: FilterName.emosss.rawValue, filter: filter.EmbossFilters) ,
                       FullFilter.init(FilterName: FilterName.Swirl.rawValue,
                                       filter: filter.SwirlDistortionFilter) ,
                       FullFilter.init(FilterName: FilterName.Polar.rawValue,
                                       filter: filter.PolarPixellateFilters) ,
                       FullFilter.init(FilterName: FilterName.Half.rawValue,
                                       filter: filter.Halftoneilter)]
        
        FilterObjects.accept(Filters)
    }
    
}
extension FilterViewModel : ApplyFilter {
    func applyFilter(operation: BasicOperation) {
        let filteredImage = Constant().image.filterWithOperation(operation)
        filterImage.accept(filteredImage)
    }
}

extension FilterViewModel : pushVideoFilter {
    func pushView() {
        router?.navigateToVideoView()
        
    }
}

struct FullFilter {
    var FilterName : String!
    var filter : BasicOperation
}

enum FilterName : String {
    case emosss = "emboss"
    case Swirl = "Swirl"
    case Polar = "Polar"
    case Half = "Half"
}

class Filter {
    var EmbossFilters = EmbossFilter()
    var SwirlDistortionFilter = SwirlDistortion()
    var PolarPixellateFilters = PolarPixellate()
    var Halftoneilter = Halftone()
    
}

