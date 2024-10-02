//
//  ViewController.swift
//  hitTestDemo
//
//  Created by Changjun Li on 2024/10/2.
//

import UIKit

// 创建红色视图类
class RedView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 首先，遍历子视图
        for subview in subviews {
            if subview.frame.contains(point) {
                return subview
            }
        }
        return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 打印红色视图响应的事件
        print("Red view touches began")
        
//        // 调用 super，将事件传递给下一个响应者
//        super.touchesBegan(touches, with: event)
    }
}

// 创建蓝色视图类
class BlueView: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 打印蓝色视图响应的事件
        print("Blue view touches began")
        
        // 获取当前触摸点
        if let touch = touches.first {
            // 获取在 self.view 上的点
            let touchPoint = touch.location(in: self.superview)
            
            // 检查是否在父视图（红色视图）的范围内，但只触发红色视图的事件在重叠部分
            if let redView = self.superview as? RedView, redView.bounds.contains(touchPoint) {
                redView.touchesBegan(touches, with: event)
            }
        }
        // 调用 super，将事件传递给下一个响应者
        //super.touchesBegan(touches, with: event)
    }
    

}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建红色视图
        let redView = RedView(frame: CGRect(x: 50, y: 200, width: 300, height: 300))
        redView.backgroundColor = .red
        self.view.addSubview(redView)
    
        // 创建蓝色视图，并将其作为红色视图的子视图
        let blueView = BlueView(frame: CGRect(x: 0, y: 200, width: 300, height: 300))
        blueView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        redView.addSubview(blueView)
    }
}

