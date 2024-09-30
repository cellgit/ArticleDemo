//
//  ViewController.swift
//  SceneDelegateDisable
//
//  Created by admin on 2024/9/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel.init()
        label.text = "小熊翻译\n AppStore免费下载Mac,iOS版, 启动开挂人生"
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        label.frame = CGRect(x: 16, y: UIScreen.main.bounds.height/2-22, width: self.view.frame.width - 32, height: 44)
    }


}

