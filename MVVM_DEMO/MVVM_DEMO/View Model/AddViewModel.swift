//
//  AddViewModel.swift
//  MVVM_DEMO
//
//  Created by FETC_iMac2 on 2022/5/18.
//

import Foundation


final class AddViewModel {

    typealias handler = () -> Void

    var modelManager: ModelManager!

    //ViewController Closure
    var updateModel: handler?

    //State
    var isupdate = false {
        didSet{
            updateModel?()
        }
    }

    init(modelManager: ModelManager) {
        self.modelManager = modelManager
    }

    func addModel(model: Model?){
        if let model = model {
            isupdate = true
            modelManager.model.append(model)
        }else{
            isupdate = false
        }

    }

}
