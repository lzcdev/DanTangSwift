//
//  HomeBannerModel.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SwiftyJSON

struct HomeBannerModel {
    var homeBanner = [HomeBannerModel]()
    var targetModel = [TargetModel]()
    //var image_url: String? // 用的这个
    init(json: JSON) {
        for data in json.arrayValue {
            //image_url = data["image_url"].stringValue
            targetModel.append(TargetModel(target: data["target"]))
            homeBanner.append(self)
            //homeBanner.append(BannersModel(banners: data) as AnyObject)
            //homeBanner.append(image_url as AnyObject)
            //QL1(image_url)
        }
    }
    
    struct BannersModel {
        var image_url: String? // 用的这个
 
        init(banners: JSON) {
            image_url = banners["image_url"].stringValue
        }
    }
    
    struct TargetModel {
        var banner_image_url: String?
        var subtitle: String?
        var title: String?
        var cover_image_url: String?
        
        init(target: JSON) {
            banner_image_url = target["banner_image_url"].stringValue
            subtitle = target["subtitle"].stringValue
            title = target["title"].stringValue
            cover_image_url = target["cover_image_url"].stringValue
        }
    }
    
}

