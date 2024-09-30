//
//  AppDelegate.swift
//  PaySdkDemo
//
//  Created by admin on 2024/9/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        SdkAppDelegate.shared.registerWXApi(appid: "wxaxxxxxxxxxx", universalLink: "")
        WXApi.registerApp("wxaxxxxxxxxxx")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }

    // MARK: - 处理通过 URL 启动应用的情况 (iOS 9.0 以下)
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }
    
    func onResp(_ resp: BaseResp) {
        
        debugPrint("resp ====== \(resp)")
        
        if let authResp = resp as? SendAuthResp {
            // 登录回调处理
            if authResp.errCode == 0 {
                // 用户同意授权, 可以根据 authResp.code 获取 access token 等
                print("授权成功，授权码为：\(authResp.code ?? "")")
            } else {
                print("授权失败，错误码：\(authResp.errCode)")
            }
        } else if let payResp = resp as? PayResp {
            // 微信支付回调处理
            if payResp.errCode == 0 {
                print("支付成功")
            } else {
                print("支付失败，错误码：\(payResp.errCode)")
            }
        }
        
        
    }

}

