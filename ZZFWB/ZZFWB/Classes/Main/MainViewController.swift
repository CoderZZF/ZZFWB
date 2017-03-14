//
//  MainViewController.swift
//  ZZFWB
//
//  Created by zhangzhifu on 2017/3/15.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    // swift支持方法的重载
    // 方法的重载:方法的名称相同,但是参数不同(类型不同或者个数不同)
    private func addChildViewController(childVC: UIViewController, title : String, imageName : String) {
        // 1. 设置子控制器的属性
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        // 2. 包装导航控制器
        let childNav = UINavigationController(rootViewController: childVC)
        
        // 3. 添加控制器
        addChildViewController(childNav)
    }
}
