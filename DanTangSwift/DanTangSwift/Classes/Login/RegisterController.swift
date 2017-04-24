//
//  RegisterController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/19.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    // 默认弹出键盘
    @IBOutlet weak var phoneField: UITextField! {
        didSet {
            phoneField.becomeFirstResponder()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "注册"
    }


}

