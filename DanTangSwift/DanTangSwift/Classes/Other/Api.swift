
//
//  Api.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import Foundation

let api = Api()

struct Api {
    
    // 公共地址
    let baseUrl = "http://api.dantangapp.com/"
    // 首页banner地址
    let bannerUrl = "v1/banners?channel=iOS"
    // 首页列表地址
    let channelsUrl = "/v1/channels/4/items?gender=1&generation=1&limit=20&offset=0"
    
    
}
