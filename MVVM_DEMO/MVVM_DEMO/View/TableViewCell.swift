//
//  TableViewCell.swift
//  MVVM_DEMO
//
//  Created by FETC_iMac2 on 2022/5/18.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titlelb: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(model: Model){
        titlelb.text = model.title
    }

}
