//
//  AFNetworkManager.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD

struct AFError: Error {
    var localizedDescription: String
    var code: Int
}

struct AFNetworkManager {
    
    // GET
    static func get(_ urlString: String, param: [String: Any]?, success: @escaping (JSON) -> Void, failure: @escaping (AFError) -> Void) -> Void {
        
        let realUrl = api.baseUrl + urlString
        Alamofire.request(realUrl, method: .get, parameters: param).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                failure(AFError(localizedDescription: "加载失败", code: 0))
                return
            }
 
            let json = JSON(data: response.data!)
            if json["code"] == 200 {
                success(json)
            } else {
                QL2("code == \(json["code"])")
                failure(AFError(localizedDescription: "请求错误", code: json["code"].intValue))
            }
        }
    }
    
    
    // POST
    
}
