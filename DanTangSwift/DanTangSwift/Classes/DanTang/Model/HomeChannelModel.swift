//
//  HomeChannelModel.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/14.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class HomeChannelModel: NSObject {
    var id: Int?
    var editable: Bool?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        editable = dict["editable"] as? Bool
        name = dict["name"] as? String
    }
}
