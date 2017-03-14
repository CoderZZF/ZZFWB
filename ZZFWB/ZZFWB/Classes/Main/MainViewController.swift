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
        
        addChildViewController("HomeViewController", title: "首页", imageName: "tabbar_home")
        addChildViewController("MessageViewController", title: "消息", imageName: "tabbar_message_center")
        addChildViewController("DiscoverViewController", title: "发现", imageName: "tabbar_discover")
        addChildViewController("ProfileViewController", title: "我", imageName: "tabbar_profile")
    }
    
    // swift支持方法的重载
    // 方法的重载:方法的名称相同,但是参数不同(类型不同或者个数不同)
    private func addChildViewController(childVCName: String, title : String, imageName : String) {
        // 获取命名空间
        guard let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有获取到命名空间")
            return
        }
        
        // 1. 根据字符串获取对应的class
        guard let childVcClass = NSClassFromString(nameSpace + "." + childVCName) else {
            print("没有获取到字符串对应的class")
            return
        }
        
        // 2. 将对应的AnyObject转换成控制器的类型
        guard let childVcType = childVcClass as? UIViewController.Type else {
            print("没有获取到对应控制器的类型")
            return
        }
        
        // 3. 创建对应的控制器对象
        let childVc = childVcType.init()
        
        // 4. 设置子控制器的属性
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        // 5. 包装导航控制器
        let childNav = UINavigationController(rootViewController: childVc)
        
        // 6. 添加控制器
        addChildViewController(childNav)
    }
}
