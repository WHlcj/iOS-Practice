//
//  ViewController.swift
//  UIScrollViewDemo
//
//  Created by Changjun Li on 2024/9/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 创建 UIScrollView
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = .white
        self.view.addSubview(scrollView)

        // 创建一个容器视图，用于放置内容
        let contentView = UIView()
        contentView.backgroundColor = .lightGray
        scrollView.addSubview(contentView)

        // 设置容器视图的大小，可以比 UIScrollView 大
        let contentHeight: CGFloat = 3500
        contentView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: contentHeight)

        // 为容器视图添加一些子视图
        for i in 0..<5 {
            let subView = UIView()
            subView.backgroundColor = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple][i]
            subView.frame = CGRect(x: self.view.frame.width / 2 - 100, y: CGFloat(300 * i), width: 200, height: 200)
            print("position: \(subView.center)")
            contentView.addSubview(subView)
        }

        // 设置 UIScrollView 的滚动范围 (contentSize)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1500)
        // scrollView.contentOffset = CGPoint(x: 300, y: 500)
        
        // 开启垂直方向和水平方向的弹性效果
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
    }


}

