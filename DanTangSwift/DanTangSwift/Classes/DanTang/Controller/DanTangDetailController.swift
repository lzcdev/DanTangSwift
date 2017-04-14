//
//  DanTangDetailController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/7.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import MJRefresh

let cellID = "cellID"

class DanTangDetailController: BaseController {
    
    var tableView = UITableView()
    var bannerImageArray = [String]()
    var bannerModels = [HomeBannerModel]()
    var listModels = [HomeListModel]()
    var type: Int = 0
    var offset: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        print(type)
        loadBannerData()
        loadListData(type: type, offset: 0)
        
        // 下拉刷新上拉加载
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNew))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
        
    }
    // 下拉刷新
    @objc private func loadNew() {
        offset = 0
        tableView.mj_header.beginRefreshing()
        loadBannerData()
        loadListData(type: type, offset: offset)
        tableView.mj_header.endRefreshing()
        
    }
    // 上拉加载
    @objc private func loadMore() {
        tableView.mj_footer.beginRefreshing()
        loadListData(type: type, offset: offset)
        tableView.mj_footer.endRefreshing()
        
    }
    
    /// 请求banner数据
    func loadBannerData() {
        // 如果是首页就有banner
        guard type == 4 else {
            return
        }
        
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
    
    /// 获取首页列表数据
    ///
    /// - Parameter type: 数据类型
    func loadListData(type: Int, offset: Int) {
        
        let idUrl = "/\(type)/items"
        let param = [
            "gender": "1",
            "generation": "1",
            "limit": "20",
            "offset": String(offset)
        ]
        
        AFNetworkManager.get(api.listUrl+idUrl, param: param, success: { (response) in
            QL1(response)
            
            if self.offset == 0 {
                self.listModels.removeAll()
            }
            self.offset += 20
            // 组装model
            if let data = response["data"]["items"].arrayObject {
                for item in data {
                    let list = HomeListModel(dict: item as! [String : AnyObject])
                    self.listModels.append(list)
                }
            }
            
            self.tableView.reloadData()
        }) { (error) in
            
        }
    }
    
    func setTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - NavHeight - TabHeight - HomeTitlesViewHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "DanTangDetailCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
}


// MARK: UITableViewDelegate
extension DanTangDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        QL2(indexPath.row)
        let detailController = WebController()
        detailController.urlString = listModels[indexPath.row].content_url
        detailController.title = "攻略详情"
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: UITableViewDataSource
extension DanTangDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DanTangDetailCell
        cell.homeList = listModels[indexPath.row]
        cell.like = { (index) in
            print(index)
            self.present(LoginController(), animated: true, completion: nil)
        }
        return cell
    }

}
