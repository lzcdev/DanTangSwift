//
//  DanPinModel.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/25.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DanPinModel: NSObject {
    
    var type: String?
    var dataModel: DataModel?
    
    init(dict: [String: AnyObject]) {
        type = dict["type"] as? String
        dataModel = DataModel(target: dict["data"] as! [String : AnyObject])
        
    }
    
    // 并没有用到
    struct DataModel {
        var description: String?
        var url: String?
        var purchase_url: String?
        //var image_urls = [String]()
        var is_favorite: String?
        var name: String?
        var purchase_status: Int?
        var favorites_count: Int?
        var cover_image_url: String?
        var price: String?
        
        
        init(target: [String: AnyObject]) {
            description = target["description"] as? String
            url = target["url"] as? String
            purchase_url = target["purchase_url"] as? String
            is_favorite = target["is_favorite"] as? String
            name = target["name"] as? String
            purchase_status = target["purchase_status"] as? Int
            favorites_count = target["favorites_count"] as? Int
            cover_image_url = target["cover_image_url"] as? String
            price = target["price"] as? String
            
            
        }
    }
}
