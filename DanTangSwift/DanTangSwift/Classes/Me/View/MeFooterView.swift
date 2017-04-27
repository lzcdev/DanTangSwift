//
//  MeFooterView.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/26.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit

class MeFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(likeBtn)
        addSubview(messageLab)
        
        likeBtn.snp.makeConstraints { (make) in
            make.center.equalTo(self.center)
            make.width.height.equalTo(50)
        }
        messageLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(likeBtn.snp.bottom).offset(10)
        }
    }
    
    private lazy var likeBtn: UIButton = {
        let likeBtn = UIButton()
        likeBtn.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        likeBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return likeBtn
    }()
    
    private lazy var messageLab: UILabel = {
       let messageLab = UILabel()
        messageLab.text = "登录以享受功能"
        messageLab.textAlignment = .center
        messageLab.textColor = UIColor.colorWith(200, green: 200, blue: 200, alpha: 1)
        messageLab.font = UIFont.systemFont(ofSize: 15)
        return messageLab
    }()
    
    func login() {
        let nav = DTNavigationController(rootViewController: LoginController())
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
}
