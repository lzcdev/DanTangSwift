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
        
        likeBtn.snp.makeConstraints { (make) in
            make.center.equalTo(self.center)
            make.width.height.equalTo(50)
        }
    }
    
    private lazy var likeBtn: UIButton = {
        let likeBtn = UIButton()
        likeBtn.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        likeBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return likeBtn
    }()
    
    func login() {
        let nav = DTNavigationController(rootViewController: LoginController())
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
}
