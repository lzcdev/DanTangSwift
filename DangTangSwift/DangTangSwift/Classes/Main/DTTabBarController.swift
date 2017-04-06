//
//  DTTabBarController.swift
//  DangTangSwift
//
//  Created by LuzhiChao on 2017/4/6.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setAllChildControllers()
    
    }
    
    private func setAllChildControllers() {
        addChildViewController(childController: DTDanTangController(), title: "单糖", imageName: "TabBar_home_23x23_", selectedImageName: "TabBar_home_23x23_selected")
        addChildViewController(childController: DTDanPinController(), title: "单品", imageName: "TabBar_gift_23x23_", selectedImageName: "TabBar_gift_23x23_selected")
        addChildViewController(childController: DTClassifyController(), title: "分类", imageName: "TabBar_category_23x23_", selectedImageName: "TabBar_category_23x23_selected")
        addChildViewController(childController: DTMeController(), title: "我", imageName: "TabBar_me_boy_23x23_", selectedImageName: "TabBar_me_boy_23x23_selected")
        
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childController.title = title
        tabBar.tintColor = UIColor.colorWith(245, green: 90, blue: 93, alpha: 1)
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        addChildViewController(DTNavigationController(rootViewController: childController))
    }

}
