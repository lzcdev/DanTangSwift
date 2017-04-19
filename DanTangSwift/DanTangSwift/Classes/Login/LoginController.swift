//
//  LoginController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/12.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "登录"
        setNav()
    }
    
}

// MARK: - setNav
extension LoginController {
    func setNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(LoginController.cancleClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(LoginController.registerClick))
    }
    
    func cancleClick() {
        dismiss(animated: true, completion: nil)
    }
    
    func registerClick() {
        navigationController?.pushViewController(RegisterController(), animated: true)
    }
}
