//
//  DTMeController.swift
//  DangTangSwift
//
//  Created by LuzhiChao on 2017/4/6.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class DTMeController: UIViewController {

    // 隐藏导航
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        let tableView = UITableView(frame: MainBounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = headerView
    }
    
    private lazy var headerView: MeHeaderView = {
        let headerView = MeHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        return headerView
    }()
    
    private lazy var footerView: MeFooterView = {
       let footerView = MeFooterView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        return footerView
    }()
    

}

// MARK: -- UITableViewDelegate
extension DTMeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = MeChoiceView()
        return choiceView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}

// MARK: -- 
extension DTMeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}


