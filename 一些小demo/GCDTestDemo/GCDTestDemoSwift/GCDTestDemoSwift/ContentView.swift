//
//  ContentView.swift
//  GCDTestDemoSwift
//
//  Created by Changjun Li on 2024/7/5.
//

import SwiftUI

struct ContentView: View {
    
    @State var sum = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 50, height: 50)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(sum)")
            myButton
        }
        .padding()
    }
    
    var myButton: some View {
        Button {
            GCDTest_2()
        } label: {
            Text("+1")
        }
    }
    
    // MARK: GCDTest
    /// 创建GCD队列的方式
    func GCDTest_1() {
        // 创建队列
        let concurrentQueue = DispatchQueue(label: "com.example.myserial", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit)
//        let mainQueue = DispatchQueue.main      // 获取主队列
        let globalBackground = DispatchQueue.global(qos: .background)
        // 向队列提交任务
        concurrentQueue.async {
            print("直接调用线程: \(Thread.current)")
        }
        globalBackground.asyncAfter(deadline: .now()+2, execute: {
            GCDTest_1()
            print("间隔2秒调用线程: \(Thread.current)")
        })
    }
    
    /// 向串行队列提交任务
    func GCDTest_2() {
        sum += 1
        let serialQueue = DispatchQueue(label: "com.example.myserial")
        let concurrentQueue = DispatchQueue(label: "com.example.myconcurrent", attributes: .concurrent)
        print("start")
        concurrentQueue.async {
            print("closure1 start")
            sleep(3)
            print("closure1 调用线程: \(Thread.current)")
        }
        concurrentQueue.async {
            print("closure2 start")
            sleep(2)
            print("closure2 调用线程: \(Thread.current)")
        }
        concurrentQueue.async {
            print("closure3 start")
            sleep(1)
            print("closure3 调用线程: \(Thread.current)")
        }
        print("end")
    }
// MARK: QoS
    /// QoS示例 - 向不同QoS队列提交任务
    func GCDTest_3_1() {
        // 获取不同 QoS 级别的全局并发队列
        let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
        let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
        let utilityQueue = DispatchQueue.global(qos: .utility)
        let backgroundQueue = DispatchQueue.global(qos: .background)
        
        // 提交任务到各个队列
        backgroundQueue.async {
            print("Background task started")
            Thread.sleep(forTimeInterval: 1)
            print("Background task finished")
        }
        utilityQueue.async {
            print("Utility task started")
            Thread.sleep(forTimeInterval: 1)
            print("Utility task finished")
        }
        userInitiatedQueue.async {
            print("User Initiated task started")
            Thread.sleep(forTimeInterval: 1)
            print("User Initiated task finished")
        }
        userInteractiveQueue.async {
            print("User Interactive task started")
            Thread.sleep(forTimeInterval: 1)
            print("User Interactive task finished")
        }
    }
    
    /// QoS示例 - 向同一队列提交不同QoS任务
    func GCDTest_3_2() {
        let defaultQueue = DispatchQueue.global(qos: .default)
        
        defaultQueue.async(qos: .background) {
            print("Background task")
        }
        defaultQueue.async(qos: .utility) {
            print("Utility task")
        }
        defaultQueue.async(qos: .userInitiated) {
            print("User Initiated task")
        }
        defaultQueue.async(qos: .userInteractive) {
            print("User Interactive task")
        }
        print("-----------------------------")
    }
    
// MARK: Semaphore
    /// 初探信号量Semaphore
    func GCDTest_4() {
        sum += 1
        let myconcurrent = DispatchQueue(label: "com.example.myconcurrent", attributes: .concurrent)
        let mysemaphore = DispatchSemaphore(value: 0)
        print("start")
        myconcurrent.asyncAfter(deadline: .now()+2, execute: {
            print("signal前")
            mysemaphore.signal()
        })
        print("wait前")
        mysemaphore.wait()
        print("end")
    }
}

// MARK: 单例
class Singleton {
    static let shared = Singleton()
    private init() {
        // 私有化初始化方法，防止外部创建新的实例
        print("Singleton instance created")
    }
    
    func doSomething() {
        print("Singleton method called")
    }
}

#Preview {
    ContentView()
}
