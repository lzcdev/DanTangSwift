
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
    let bannerUrl = "v1/banners"
    
    // 首页几个标签
    let channelsUrl = "v2/channels/preset"
    
    // 首页列表地址
    let listUrl = "/v1/channels"
    
    // 首页banner点进去的列表
    let bannerDetailUrl = "v1/collections"
    
    // 单品
    let danPinListUrl = "v2/items"
    
}
