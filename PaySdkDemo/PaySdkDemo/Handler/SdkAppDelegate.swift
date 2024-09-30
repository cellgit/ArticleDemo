//
//  SdkAppDelegate.swift
//  PaySdkDemo
//
//  Created by admin on 2024/9/30.
//

import Foundation


public class SdkAppDelegate: NSObject, WXApiDelegate {
    public static let shared = SdkAppDelegate()
    
    private override init() {super.init()}
    
    public func registerWXApi(appid: String, universalLink: String) {
        WXApi.registerApp(appid, universalLink: universalLink)
    }
    
    func testLog() {
        if let url = URL(string: "wx15de3130df5xxxxxx://") {
            UIApplication.shared.canOpenURL(url)
        }
    }
    
    public func onReq(_ req: BaseReq) {
        debugPrint("req ===== \(req)")
        
        if req.isKind(of: GetMessageFromWXReq.self) {
            
        }
        else if req.isKind(of: ShowMessageFromWXReq.self) {
            
        }
        else if req.isKind(of: LaunchFromWXReq.self) {
            
        }
        
    }
    
    public func onResp(_ resp: BaseResp) {
        
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
    
    func openUrl(url: URL) {
        
        WXApi.handleOpen(url, delegate: self)
        
//        return WXApi.handleOpenURL(url, delegate: WXApiManager.sharedManager());
    }
    
    
}

//
//extension SdkAppDelegate {
//    
//    
//}
