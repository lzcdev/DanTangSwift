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
    var bannerModels = [HomeBannerModel]()
    var listModels = [HomeListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        loadBannerData()
        loadListData(id: 4)
        
    }
    /// 请求banner数据
    func loadBannerData() {
        
        AFNetworkManager.get(api.bannerUrl, param: ["channel":"iOS"], success: { (response) in
            //QL2(response)
            // 组装model
            if let data = response["data"]["banners"].arrayObject {
                for item in data {
                    let banner = HomeBannerModel(dict: item as! [String : AnyObject])
                    self.bannerModels.append(banner)
                }
            }
            // banner几张图片
            for item in self.bannerModels {
                self.bannerImageArray.append(item.image_url!)
            }
            
            let cycleView = CycleView.cycleScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150), imageNameGroup: self.bannerImageArray.count > 0 ? self.bannerImageArray : ["walkthrough_1", "walkthrough_2", "walkthrough_3"])
            self.tableView.tableHeaderView = cycleView
            self.tableView.reloadData()
        }) { (error) in
            
        }
    }
    
    func loadListData(id: Int) {
        
        let idUrl = "/\(id)/items"
        let param = [
            "gender": "1",
            "generation": "1",
            "limit": "20",
            "offset": "0",
        ]
        
        AFNetworkManager.get(api.channelsUrl+idUrl, param: param, success: { (response) in
            QL1(response)
            // 组装model
            if let data = response["data"]["items"].arrayObject {
                for item in data {
                    let list = HomeListModel(dict: item as! [String : AnyObject])
                    self.listModels.append(list)
                }
            }
            //
//            for item in self.listModels {
//                QL1(item.cover_image_url)
//            }
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
        return listModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DanTangDetailCell
        cell.titleLab.text = listModels[indexPath.row].title! +  listModels[indexPath.row].title!
        QL1(listModels[indexPath.row].cover_image_url)
        cell.backgroundImage.kf.setImage(with: URL(string: listModels[indexPath.row].cover_image_url!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        QL2(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
