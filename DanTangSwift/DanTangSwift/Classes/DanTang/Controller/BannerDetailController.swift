//
//  BannerDetailController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/19.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class BannerDetailController: UIViewController {

    var tableView = UITableView()
    var id: Int?
    var listModels = [HomeListModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        
        loadListData(id: id!)
    }

    /// 获取列表数据
    ///
    /// - Parameter type: 数据类型
    func loadListData(id: Int) {
        
        let idUrl = "/\(id)/posts"
        let param = [
            "gender": "1",
            "generation": "1",
            "limit": "20",
            "offset": "0"
        ] 
        AFNetworkManager.get(api.bannerDetailUrl+idUrl, param: param, success: { (response) in
            QL1(response)
               // 组装model
            if let data = response["data"]["posts"].arrayObject {
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
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "DanTangDetailCell", bundle: nil), forCellReuseIdentifier: "banner")
    }
    
}

// MARK: - UITableViewDelegate
extension BannerDetailController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = WebController()
        detailController.urlString = listModels[indexPath.row].content_url
        detailController.title = "攻略详情"
        navigationController?.pushViewController(detailController, animated: true)

    }
}

// MARK: - UITableViewDataSource
extension BannerDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "banner", for: indexPath) as! DanTangDetailCell
        cell.homeList = listModels[indexPath.row]
        cell.like = { (index) in
            print(index)
            self.present(LoginController(), animated: true, completion: nil)
        }
        return cell
    }
}
