//
//  DanTangDetailCell.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/7.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DanTangDetailCell: UITableViewCell {

    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func favorite(_ sender: Any) {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        titleLab.adjustsFontSizeToFitWidth = true
    }
    
}
