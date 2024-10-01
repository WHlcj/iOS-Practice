//
//  ViewController.swift
//  NSOperationDemo
//
//  Created by Changjun Li on 2024/10/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 创建一个 NSOperationQueue
        let operationQueue = OperationQueue()

        // 使用 NSBlockOperation 创建任务
        let operation1 = BlockOperation {
            for i in 1...3 {
                print("Operation 1: \(i)")
                sleep(1) // 模拟耗时任务
            }
        }
        let operation2 = BlockOperation {
            for i in 1...3 {
                print("Operation 2: \(i)")
                sleep(1) // 模拟耗时任务
            }
        }

        // 添加依赖，确保 operation2 在 operation1 完成后执行
        operation1.addDependency(operation2)

        // 将操作添加到队列中
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        // 取消任务1
        operation1.cancel()
    }
}

