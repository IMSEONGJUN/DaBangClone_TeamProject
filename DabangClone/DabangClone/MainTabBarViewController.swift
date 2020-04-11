//
//  MainViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/20.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import KakaoOpenSDK

class MainTabBarViewController: UITabBarController {
  private let homeVC = UINavigationController(rootViewController: HomeViewController())
  private let favoriteVC = UINavigationController(rootViewController: FavoriteListViewController())
  private let mapVC = UINavigationController(rootViewController: MapViewController())
  private let saleVC = UINavigationController(rootViewController: SaleViewController())
  private let moreVC = UINavigationController(rootViewController: MoreViewController())

    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    homeVC.navigationBar.isHidden = true
    homeVC.tabBarItem = UITabBarItem(title: "홈", image: nil, tag: 0)
    favoriteVC.navigationBar.isHidden = true
    favoriteVC.tabBarItem = UITabBarItem(title: "관심목록", image: nil, tag: 1)
    mapVC.navigationBar.isHidden = true
    mapVC.tabBarItem = UITabBarItem(title: "지도", image: nil, tag: 2)
    saleVC.navigationBar.isHidden = true
    saleVC.tabBarItem = UITabBarItem(title: "분양", image: nil, tag: 3)
    moreVC.navigationBar.isHidden = true
    moreVC.tabBarItem = UITabBarItem(title: "더보기", image: nil, tag: 4)
    
    

    viewControllers = [homeVC,favoriteVC,mapVC,saleVC,moreVC]
    
    //    smokingAreaVC.tabBarItem = UITabBarItem(title: "Area", image: UIImage(systemName: "map"), tag: 0)
    //    smokingAreaVC.tabBarItem.selectedImage = UIImage(systemName: "map.fill")
        
    //    timerVC.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(systemName: "chart.pie"), tag: 2)
    //    timerVC.tabBarItem.selectedImage = UIImage(systemName: "chart.pie.fill")
    //    if self.traitCollection.userInterfaceStyle == .dark {
    //        tabBar.tintColor = .lightGray
    //    } else {
    //        tabBar.tintColor = .orange
    //    }
  }
}
