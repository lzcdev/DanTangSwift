//
//  HomeBannerModel.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeBannerModel: NSObject {
    var targetModel: TargetModel?
    var image_url: String? // 用的这个
    
    init(dict: [String: AnyObject]) {
        image_url = dict["image_url"] as? String
        targetModel = TargetModel(target: dict["target"] as! [String : AnyObject])
    }
    // 并没有用到
    struct TargetModel {
        var banner_image_url: String?
        var subtitle: String?
        var title: String?
        var cover_image_url: String?
        
        init(target: [String: AnyObject]) {
            banner_image_url = target["banner_image_url"] as? String
            subtitle = target["subtitle"] as? String
            title = target["title"] as? String
            cover_image_url = target["cover_image_url"] as? String
        }
    }
    
}

