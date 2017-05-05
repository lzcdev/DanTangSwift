//
//  DTDanTangController.swift
//  DangTangSwift
//
//  Created by LuzhiChao on 2017/4/6.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DTDanTangController: BaseController, UIScrollViewDelegate {
    
    var topScrollView = UIScrollView() // 顶部
    let line = UIView() // 小横线
    let contentView = UIScrollView() // 下面的内容区域
    var selectedButton: UIButton! // 顶部背景上的按钮
    var channelModels = [HomeChannelModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 右上角搜索按钮
        setSearchBtn()
        // 获取channel,设置控制器
        getAllChannels()
        
        
    }
    
    private func setSearchBtn() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(search))
    }
    
    func search() {
        QL2("search")
    }
    
    func getAllChannels() {
        let param = [
            "gender": "1",
            "generation": "1"
        ]
        AFNetworkManager.get(api.channelsUrl, param: param, success: { (response) in
            // 组装model
            if let data = response["data"]["channels"].arrayObject {
                for item in data {
                    let list = HomeChannelModel(dict: item as! [String : AnyObject])
                    self.channelModels.append(list)
                }
            }
            
            for model in self.channelModels {
                let ctrl = DanTangDetailController()
                ctrl.title = model.name
                ctrl.type = model.id!
                self.addChildViewController(ctrl)
            }
            
            // 顶部滑动
            self.setTopView()
            // 正文
            self.setContentView()
            
        }) { (error) in
            print(error)
        }
    }
    
    private func setTopView() {
        
        let count = self.childViewControllers.count
        let buttonW = ScreenWidth / 5
        
        
        topScrollView = UIScrollView(frame: CGRect(x: 0, y: NavHeight, width: ScreenWidth, height: HomeTitlesViewHeight))
        topScrollView.contentSize = CGSize(width: ScreenWidth / 5 * count , height: 0)
        topScrollView.showsHorizontalScrollIndicator = false
        view.addSubview(topScrollView)
        
        
        line.backgroundColor = GlobalColor
        line.frame.size.height = 2
        line.frame.origin.y = CGFloat(HomeTitlesViewHeight - 2);
        line.frame.size.width = CGFloat(buttonW / 2);
        
        selectedButton = UIButton()
        
        for index in 0..<count {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: index * buttonW, y: 0, width: buttonW, height: HomeTitlesViewHeight)
            let vc = self.childViewControllers[index]
            button.setTitle(vc.title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.tag = index + 1
            button.isSelected = false
            button.addTarget(self, action: #selector(changeVC(button:)), for: .touchUpInside)
            topScrollView.addSubview(button)
            
            if index == 0 {
                changeVC(button: button)
                line.center.x = button.center.x
                button.isSelected = true
                button.setTitleColor(GlobalColor, for: .normal)
                selectedButton = button;
                
            }
            
        }
        topScrollView.addSubview(line)
        
        
    }
    
    func changeVC(button: UIButton) -> Void {
        
        UIView.animate(withDuration: 0.25) {
            self.line.center.x = button.center.x
        }
        
        if selectedButton == button {
            return
        }
        
        if button.tag == 2 {
            UIView.animate(withDuration: 0.25) {
                self.topScrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }
        
        if button.tag == 5 {
            UIView.animate(withDuration: 0.25) {
                self.topScrollView.contentOffset = CGPoint(x: ScreenWidth / 5, y: 0)
            }
        }
        
        selectedButton.isSelected = false
        button.isSelected = true
        button.setTitleColor(GlobalColor, for: .normal)
        selectedButton.setTitleColor(UIColor.black, for: .normal)
        selectedButton = button
        
        
        var point = contentView.contentOffset;
        point.x = CGFloat((button.tag-1)) * contentView.frame.size.width;
        contentView.setContentOffset(point, animated: true)
    }
    
    func setContentView() {
        
        automaticallyAdjustsScrollViewInsets = false
        contentView.frame = CGRect(x: 0, y: NavHeight+HomeTitlesViewHeight, width: Int(ScreenWidth), height: Int(ScreenHeight) - NavHeight - TabHeight)
        contentView.isPagingEnabled = true
        contentView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(self.childViewControllers.count), height: 0)
        contentView.bounces = false
        contentView.delegate = self
        self.view.insertSubview(contentView, at: 0)
        self.scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / self.view.frame.size.width;
        let vc: UIViewController = self.childViewControllers[Int(index)];
        vc.view.frame.origin.x = scrollView.contentOffset.x
        vc.view.frame.origin.y = 0
        vc.view.frame.size.height = scrollView.frame.size.height
        scrollView.addSubview(vc.view)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.scrollViewDidEndScrollingAnimation(scrollView)
        let index = scrollView.contentOffset.x / self.view.frame.size.width;
        changeVC(button: topScrollView.subviews[Int(index)+1] as! UIButton)
    }
    
}
