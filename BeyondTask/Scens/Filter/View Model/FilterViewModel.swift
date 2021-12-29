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

class FilterViewModel: SmoothFilter{
    
     var filterImage = BehaviorRelay<UIImage>(value:UIImage())
    private  let filter = Filter()
    private var FilterObjects = BehaviorRelay<[FullFilter]>(value: [])
    var FilterObjectsObservable : BehaviorRelay<[FullFilter]> {
        return FilterObjects
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
    
    func applyFilter( operation: BasicOperation) {
        let filteredImage = Constant().image.filterWithOperation(operation)
        filterImage.accept(filteredImage)
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

