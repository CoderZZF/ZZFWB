//
//  AppDelegate.swift
//  ZZFWB
//
//  Created by zhangzhifu on 2017/3/15.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 设置全局色
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        // 创建window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

