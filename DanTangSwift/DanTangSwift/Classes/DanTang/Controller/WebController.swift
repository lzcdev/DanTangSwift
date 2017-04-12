//
//  WebController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/12.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class WebController: BaseController, WKUIDelegate, WKNavigationDelegate {

    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView(frame: MainBounds)
        webView.navigationDelegate = self
        webView.load(NSURLRequest(url: URL(string: urlString!)!) as URLRequest)
        view.addSubview(webView)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show(withStatus: "正在加载")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}
