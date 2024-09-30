//
//  ViewController.swift
//  PaySdkDemo
//
//  Created by admin on 2024/9/30.
//

import UIKit

// weixin://wap/pay?prepayid%3Dwx271403063533559fa5bbaaefeed3600001&package=1276924084&noncestr=1727416986&sign=ea4c9c412c8ccebfd9ddf520bc3eedb7

class ViewController: UIViewController {

    
    let urlString = "weixin://wap/pay?prepayid%3Dwx271403063533559fa5bbaaefeed3600001&package=1276924084&noncestr=1727416986&sign=ea4c9c412c8ccebfd9ddf520bc3eedb7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建按钮
        let button = UIButton(type: .system) // 创建一个系统类型的按钮
        button.setTitle("点击我", for: .normal) // 设置按钮标题
        button.backgroundColor = UIColor.systemBlue // 设置按钮背景颜色
        button.setTitleColor(UIColor.white, for: .normal) // 设置按钮文字颜色
        button.frame = CGRect(x: 100, y: 200, width: 150, height: 50) // 设置按钮位置和大小
        
        // 添加按钮点击事件
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        // 将按钮添加到视图中
        self.view.addSubview(button)
        
        
        
    }
    
    // 按钮点击事件的处理方法
    @objc func buttonClicked() {
        debugPrint("按钮被点击了")
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) { isOpen in
                
            }
        }
        else {
            debugPrint("Url 打不开")
        }
        
    }
    

}

