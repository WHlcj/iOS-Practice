//
//  ViewController.swift
//  ShadowPathDemo
//
//  Created by Changjun Li on 2024/10/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建一个带阴影的 UIView
        let shadowedView = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        shadowedView.backgroundColor = UIColor.systemBlue
        
        // 设置阴影相关属性
        shadowedView.layer.shadowColor = UIColor.black.cgColor // 阴影颜色
        shadowedView.layer.shadowOpacity = 0.8                 // 阴影不透明度
        shadowedView.layer.shadowOffset = CGSize(width: 5, height: 5) // 阴影偏移
        shadowedView.layer.shadowRadius = 10                   // 阴影半径
        
        // 设置 shadowPath 优化阴影绘制，使用和视图形状相同的路径
        shadowedView.layer.shadowPath = UIBezierPath(rect: shadowedView.bounds).cgPath
        
        // 添加到视图
        self.view.addSubview(shadowedView)
    }
}

