//
//  DTDanPinController.swift
//  DangTangSwift
//
//  Created by LuzhiChao on 2017/4/6.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import MJRefresh

class DTDanPinController: UIViewController {
    
    var layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView?
    var listModels = [DanPinModel]()
    var offset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ?gender=1&generation=1&limit=20&offset=0
        setupCollectionView()
        
        getData(offset: offset)
        
        // 下拉刷新上拉加载
        collectionView!.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNew))
      //  collectionView!.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
    }
    
    // 下拉刷新
    @objc private func loadNew() {
        offset = 0
        collectionView!.mj_header.beginRefreshing()
        getData(offset: offset)
        collectionView!.mj_header.endRefreshing()
        
    }
    // 上拉加载
    @objc private func loadMore() {
        collectionView!.mj_footer.beginRefreshing()
        getData(offset: offset)
        collectionView!.mj_footer.endRefreshing()
        
    }
    
    // 请求列表
    func getData(offset: Int) {
        
        let param = [
            "gender": "1",
            "generation": "1",
            "limit": "20",
            "offset": String(offset),
            ]
        AFNetworkManager.get(api.danPinListUrl, param: param, success: { (response) in
            QL2(response)
            
            if offset == 0  {
                self.listModels.removeAll()
            }
            self.offset += 20
            // 组装model
            if let data = response["data"]["items"].arrayObject {
                for item in data {
                    let list = DanPinModel(dict: item as! [String : AnyObject])
                    self.listModels.append(list)
                }
            }
            self.collectionView!.reloadData()
        }) { (error) in
            
        }
    }
    
    func setupCollectionView() {
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), collectionViewLayout: layout)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        view.addSubview(collectionView!)
        collectionView!.register(UINib.init(nibName: "DanPinCell", bundle: nil), forCellWithReuseIdentifier: "DanPinCell")
    }
    
}

// MARK: -- UICollectionViewDelegate
extension DTDanPinController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        QL2("collection")
    }
}

// MARK: -- UICollectionViewDataSource
extension DTDanPinController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DanPinCell", for: indexPath) as! DanPinCell
        let model = listModels[indexPath.row]
        cell.titleLab.text = model.dataModel?.name
        cell.imageView.kf.setImage(with: URL(string: (model.dataModel?.cover_image_url)!))
        
        return cell
    }
}

// MARK: -- UICollectionViewDelegateFlowLayout
extension DTDanPinController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth / 2 - 15, height: 200)
    }
}

