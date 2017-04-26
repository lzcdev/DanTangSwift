//
//  MeHeaderView.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/26.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit

class MeHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
     // 添加子控件
        addSubview(bgImageView)
        addSubview(messageBtn)
        addSubview(settingBtn)
        addSubview(nameLab)
        addSubview(iconBtn)
        
        
        bgImageView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(-20)
        }
        
        messageBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.left.equalTo(self)
            make.top.equalTo(0)
        }
        
        settingBtn.snp.makeConstraints { (make) in
            make.size.equalTo(messageBtn.snp.size)
            make.right.equalTo(self)
            make.top.equalTo(messageBtn.snp.top)
        }
        
        nameLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-30)
            make.left.right.equalTo(self)
            make.height.equalTo(20)
        }
        
        iconBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(Double(ScreenWidth) * 0.5)
            make.height.width.equalTo(75)
            make.bottom.equalTo(nameLab.snp.top).offset(-10)
        }
    }
    
    // 背景图片
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Me_ProfileBackground")
        return bgImageView
    }()
    // 左上角按钮
    lazy var messageBtn: UIButton = {
       let messageBtn = UIButton()
        messageBtn.setImage(UIImage(named: "Me_message_20x20_"), for: .normal)
        return messageBtn
    }()
    // 右上角按钮
    lazy var settingBtn: UIButton = {
       let settingBtn = UIButton()
        settingBtn.setImage(UIImage(named: "Me_settings_20x20_"), for: .normal)
        return settingBtn
    }()
    // 头像按钮
    lazy var iconBtn: UIButton = {
        let iconBtn = UIButton()
        iconBtn.setImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconBtn.layer.cornerRadius = iconBtn.frame.size.width * 0.5
        iconBtn.layer.masksToBounds = true
        return iconBtn
    }()
    // 姓名
    lazy var nameLab: UILabel = {
        let nameLab = UILabel()
        nameLab.text = "13429689366"
        nameLab.textColor = UIColor.white
        nameLab.font = UIFont.systemFont(ofSize: 15)
        nameLab.textAlignment = .center
        return nameLab
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
