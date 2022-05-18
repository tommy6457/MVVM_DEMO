//
//  Model.swift
//  MVC_DEMO
//
//  Created by FETC_iMac2 on 2022/5/16.
//

import Foundation

struct Model {

    var title:String
    var detail:Detail

    struct Detail {

        var detailText:String

    }
}

class ModelManager {

    var model: [Model] = []

    init(model: [Model] = []) {
        self.model = model
    }

    func insertData(model: Model){

        self.model.append(model)

    }

    func deleteData(indexPath: IndexPath){

        self.model.remove(at: indexPath.row)
    }

}


