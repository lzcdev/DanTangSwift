//
//  HomeListModel.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/11.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class HomeListModel: NSObject {
    var cover_image_url: String?
    var content_url: String?
    var url: String?
    var share_msg: String?
    var title: String?
    var short_title: String?
    var liked: String?
    var likes_count: Int?
    
    init(dict: [String: AnyObject]) {
        cover_image_url = dict["cover_image_url"] as? String
        content_url = dict["content_url"] as? String
        url = dict["url"] as? String
        share_msg = dict["share_msg"] as? String
        title = dict["title"] as? String
        short_title = dict["short_title"] as? String
        liked = dict["liked"] as? String
        likes_count = dict["likes_count"] as? Int
        
    }
}
