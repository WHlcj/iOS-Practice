//
//  ViewController.swift
//  CollectionDemo
//
//  Created by Changjun Li on 2024/10/2.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dictionaryTest()
    }
    
    func arrayTest() {
        // 创建一个数组
        var fruits: [String] = ["Apple", "Banana", "Orange"]

        // 添加一个新元素
        fruits.append("Grapes")
        
        // 访问数组元素
        print("First fruit: \(fruits[0])")  // 输出: Apple

        // 遍历数组
        for fruit in fruits {
            print(fruit)
        }

        // 修改数组中的元素
        fruits[0] = "Strawberry"
        print(fruits)
    }
    
    // Set 是一个无序集合，集合中的元素是唯一的，性能较好
    func setTest() {
        // 创建一个 Set 集合
        var numbers: Set<Int> = [1, 2, 3, 4, 5]

        // 添加一个新元素
        numbers.insert(6)
        
        // 尝试添加重复的元素
        numbers.insert(3)  // 3 已存在，Set 不会重复插入
        
        // 遍历 Set
        for number in numbers {
            print(number)
        }

        // 检查是否包含某个元素
        if numbers.contains(4) {
            print("Set contains 4")
        }
        
        // 删除元素
        numbers.remove(2)
        print(numbers)
    }
    
    // Dictionary 是键值对（key-value pairs）存储的无序集合。每个键必须是唯一的，值可以通过键来访问。
    func dictionaryTest() {
        // 创建一个字典
        var studentScores: [String: Int] = ["Alice": 90, "Bob": 85, "Charlie": 88]

        // 访问字典的值
        if let score = studentScores["Alice"] {
            print("Alice's score is \(score)")
        }

        // 添加或更新字典中的值
        studentScores["David"] = 92  // 新增
        studentScores["Bob"] = 87    // 更新

        // 遍历字典
        for (name, score) in studentScores {
            print("\(name): \(score)")
        }

        // 删除键值对
        //studentScores.removeValue(forKey: "Charlie")
        studentScores["Charlie"] = nil
        studentScores["Alice"] = nil
        print(studentScores)
    }
}

