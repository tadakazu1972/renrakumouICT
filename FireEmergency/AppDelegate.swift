//
//  AppDelegate.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/09/11.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //初回起動時　デフォルト値設定　このメソッドで初期値を登録すると、既に同じキーが存在する場合は初期値をセットせず、キーが存在しない場合だけ値をセットしてくれますので大変便利
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dic = ["firstLaunch": true]
        userDefaults.registerDefaults(dic)
        //password
        let pass = ["password": "nil"]
        userDefaults.registerDefaults(pass)
        
        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        
        if let ext = url.pathExtension?.lowercaseString {
           //let tempFilePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("\(NSUUID().UUIDString).\(ext)")
            let tempFilePath = NSURL(fileURLWithPath: NSHomeDirectory() + "/Documents/fire.csv")
            do {
                try NSFileManager().moveItemAtURL(url, toURL: tempFilePath)
            } catch {
                print("ファイルのコピー失敗")
            }
        } else {
            print("拡張子が取得できません")
        }
        
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
