//
//  AppDelegate.swift
//  WatchaDoin
//
//  Created by Liuqing Du on 15/7/12.
//  Copyright © 2015年 JuneDesign. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
    
    let Sharlee = ["sharlee", "kpQtdO1jsrl9Ner9Q5AKW1nBRhzquctIvHWMLEuf8kMJvhvCkVPmGnMZ/lNdfLnwsxaQ9cuQ4OigK0ibjU9T2fFIzq+UN2R9"]
    let Tong = ["tong", "hSPC8DM0cQNL5BIbNWIGMlnBRhzquctIvHWMLEuf8kMJvhvCkVPmGmxZ+sPSfZyk/MW/yVqY2vEXFPJF0C52Hg=="]
    var cur: [String]!
    var tar: [String]!

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let UserInfo = RCUserInfo()
        UserInfo.userId = userId
        
        switch userId {
        case "sharlee" :
            UserInfo.name = "Sharlee"
            
        case "tong" :
            UserInfo.name = "Tong"
            
        default:
            print("user not found")
        }
        
        return completion(UserInfo)
    }
    
    func connectToServer(completion: () -> Void) {
        
        // user
        cur = Tong
        tar = Sharlee
        
        // appKey
        RCIM.sharedRCIM().initWithAppKey("0vnjpoadn5yfz")
        
        // connect
        RCIM.sharedRCIM().connectWithToken(cur[1], success: { (_) -> Void in
            
            let CurrentUserInfo = RCUserInfo(userId: self.cur[0], name: self.cur[0], portrait: "")
            
            RCIMClient.sharedRCIMClient().currentUserInfo = CurrentUserInfo
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
            
            }, error: { (_) -> Void in
                print("connect unsuccess")
            }) { () -> Void in
                print("wrong token")
        }
        
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // info source
        RCIM.sharedRCIM().userInfoDataSource = self
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

