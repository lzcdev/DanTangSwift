//
//  DanTangDetailController.swift
//  DanTangSwift
//
//  Created by LuzhiChao on 2017/4/7.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

let cellID = "cellID"

class DanTangDetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
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
