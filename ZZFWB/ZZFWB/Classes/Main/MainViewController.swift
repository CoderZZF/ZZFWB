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
        
        // 1. 获取json文件的路径
        guard let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil) else {
            print("没有获取到对应的文件资源")
            return
        }
        
        // 2. 读取json文件中的内容
        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
            print("没有获取到json文件中的数据")
            return
        }
        
        // 3. 将data转成数组
        guard let anyObject = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) else {
            return
        }
        
        guard let dictArray = anyObject as? [[String : AnyObject]] else {
            return
        }
        
        // 遍历字典,获取信息
        for dict in dictArray {
            // 4.1 获取控制器对应的字符串
            guard let vcName = dict["vcName"] as? String else {
                continue
            }
            // 4.2 获取控制器显示的title
            guard let title = dict["title"] as? String else {
                continue
            }
            
            // 4.3 获取控制器显示的图标名称
            guard let imageName = dict["imageName"] as? String else {
                continue
            }
            
            // 4.4 添加子控制器
            addChildViewController(vcName, title: title, imageName: imageName)
        }
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
