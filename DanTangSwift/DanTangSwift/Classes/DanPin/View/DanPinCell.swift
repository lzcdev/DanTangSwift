//
//  DanPinCell.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/25.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DanPinCell: UICollectionViewCell {


    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var likeLab: UIButton!
    var model: DanPinModel? {
        didSet {
            titleLab.text = model?.dataModel?.name
            imageView.kf.setImage(with: URL(string: (model?.dataModel?.cover_image_url)!))
            likeLab.setTitle(String(describing: model!.dataModel!.favorites_count!), for: .normal)
            priceLab.text = "￥" + model!.dataModel!.price!
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
