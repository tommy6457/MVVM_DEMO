//
//  TableViewModel.swift
//  MVVM_DEMO
//
//  Created by FETC_iMac2 on 2022/5/17.
//

import Foundation

final class TableViewModel {

    typealias handler = () -> Void
    //Model
    var modelManager: ModelManager

    //closure
    var reloadTable: handler?

    //State
    var isReload = false{
        didSet{
            self.reloadTable?()
        }
    }

    init(modelManager: ModelManager) {
        self.modelManager = modelManager
    }

}
