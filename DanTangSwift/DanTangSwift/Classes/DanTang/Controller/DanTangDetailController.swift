//
//  DanTangDetailController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/7.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import Alamofire

let cellID = "cellID"

class DanTangDetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()
    var bannerImageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        loadData()
        
    }
    
    func loadData() {
        
        AFNetworkManager.get(api.bannerUrl, param: nil, success: { (response) in
             QL2(response)
            let bannerModel = HomeBannerModel(json: response["data"]["banners"])
            QL4(bannerModel)
            
//            for index in 0..<response["data"]["banners"].count {
//                QL4(bannerModel!)
//                //QL3(bannerModel.homeBanner[index])
//            }
//            
            //self.bannerImageArray = bannerModel.homeBanner as! [String]
            
            let cycleView = CycleView.cycleScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150), imageNameGroup: self.bannerImageArray.count > 0 ? self.bannerImageArray : ["walkthrough_1", "walkthrough_2", "walkthrough_3"])
            //view.infiniteLoop = false
            //view.autoScroll = false
            //view.scrollDirection = .vertical
            //let view = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
            self.tableView.tableHeaderView = cycleView

            self.tableView.reloadData()
            
            
        }) { (error) in
            
        }
        
    }
    
    func setTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - NavHeight - TabHeight - HomeTitlesViewHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.yellow
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "DanTangDetailCell", bundle: nil), forCellReuseIdentifier: cellID)
        
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DanTangDetailCell
        cell.titleLab.text = "来一份甜食，今天怎么能不开心呢"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        QL2(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
