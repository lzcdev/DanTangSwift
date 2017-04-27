//
//  MeChoiceView.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/26.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit

class MeChoiceView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(leftBtn)
        addSubview(rightBtn)
        addSubview(indicatorView)
        
        leftBtn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightBtn)
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right)
            make.top.right.bottom.equalTo(self)
        }
        
        indicatorView.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(self)
            make.right.equalTo(leftBtn)
            make.height.equalTo(2)
        }
        

    }
    
    private lazy var leftBtn: UIButton = {
        let leftBtn = UIButton()
        leftBtn.setTitle("喜欢的商品", for: .normal)
        leftBtn.setTitleColor(UIColor.colorWith(0, green: 0, blue: 0, alpha: 0.7), for: .normal)
        leftBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        leftBtn.layer.borderWidth = 1
        leftBtn.layer.borderColor = UIColor.colorWith(230, green: 230, blue: 230, alpha: 1).cgColor
        leftBtn.isSelected = true
        return leftBtn
    }()
    
    private lazy var rightBtn: UIButton = {
        let rightBtn = UIButton()
        rightBtn.setTitle("喜欢的专题", for: .normal)
        rightBtn.setTitleColor(UIColor.colorWith(0, green: 0, blue: 0, alpha: 0.7), for: .normal)
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.borderColor = UIColor.colorWith(230, green: 230, blue: 230, alpha: 1).cgColor
        
        return rightBtn
    }()

    private lazy var indicatorView: UIView = {
       let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.colorWith(245, green: 80, blue: 83, alpha: 1)
        return indicatorView
    }()
    
    func leftBtnClick(button: UIButton) {
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: 0.25) { 
            self.indicatorView.mj_x = 0
        }
    }
    
    func rightBtnClick(button: UIButton) {
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: 0.25) {
            self.indicatorView.mj_x = CGFloat(ScreenWidth) * 0.5
        }
    }
}
