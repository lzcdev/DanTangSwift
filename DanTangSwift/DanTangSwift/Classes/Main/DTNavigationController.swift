//
//  DTNavigationController.swift
//  DangTangSwift
//
//  Created by LuzhiChao on 2017/4/6.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SVProgressHUD

class DTNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = GlobalColor
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
            backBtn.setImage(UIImage(named: "checkUserType_backward_9x15_"), for: .normal)
            backBtn.addTarget(self, action: #selector(self.back), for: .touchUpInside)
            let barBackBtn = UIBarButtonItem(customView: backBtn)
            viewController.navigationItem.leftBarButtonItems = [barBackBtn]
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func back() {
        QL2("返回")
        // 如果提示框还在就关闭
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        // 如果网络指示器还在就关闭
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        self.popViewController(animated: true)
    }

}
