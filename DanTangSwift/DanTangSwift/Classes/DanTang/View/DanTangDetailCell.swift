//
//  DanTangDetailCell.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/7.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

typealias Like = (_ index: Int) -> Void

class DanTangDetailCell: UITableViewCell {

    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    var like: Like?
    
    var homeList: HomeListModel? {
        didSet {
            titleLab.text = homeList!.title
            backgroundImage.kf.setImage(with: URL(string: homeList!.cover_image_url!))
            favoriteBtn.setTitle(" " + String(homeList!.likes_count!) + " ", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLab.adjustsFontSizeToFitWidth = true
        
        favoriteBtn.layer.cornerRadius = 8.0
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.main.scale // 降低离屏渲染缓存
        favoriteBtn.layer.shouldRasterize = true // 渲染layer并缓存，节约资源缓解卡顿
     
        backgroundImage.layer.cornerRadius = 6.0
        backgroundImage.layer.masksToBounds = true
        backgroundImage.layer.rasterizationScale = UIScreen.main.scale // 降低离屏渲染缓存
        backgroundImage.layer.shouldRasterize = true // 渲染layer并缓存，节约资源缓解卡顿
        
    }
    @IBAction func favorite(_ sender: UIButton) {
        self.like!(homeList!.likes_count!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
