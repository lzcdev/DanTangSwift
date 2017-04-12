//
//  BaseController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/12.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)

    }

}
