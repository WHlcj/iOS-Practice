//
//  ContentView.swift
//  swift_swiftui_demo
//
//  Created by Changjun Li on 2024/9/8.
//

import SwiftUI

struct ContentView: View {
    @State private var redLayer = CALayer()
    @State private var yellowLayer = CALayer()

    var body: some View {
        VStack {
            Text("CALayer Demo")
                .font(.largeTitle)
                .padding()

            // 显示 UIView，它将持有我们的 CALayer
            LayerView(redLayer: $redLayer)
                .frame(width: 300, height: 300)
                .border(Color.black, width: 1)
            
            functionButtons()
        }
        .onAppear(perform: setupLayer)
    }
    
    func functionButtons() -> some View {
        VStack {
            HStack {
                Button(action: changeAnchorPoint) {
                    Text("Change AnchorPoint")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: changePosition) {
                    Text("Change Position")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            HStack {
                Button(action: changeBounds) {
                    Text("Change Bounds")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: resetLayer) {
                    Text("Reset Position")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
    }
    // 设置初始的 CALayer
    func setupLayer() {
        redLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        redLayer.backgroundColor = UIColor.red.cgColor
        // 设置黄色方块并将其添加到红色方块中
        yellowLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        yellowLayer.backgroundColor = UIColor.yellow.cgColor
        redLayer.addSublayer(yellowLayer)
    }
    // 改变 anchorPoint
    func changeAnchorPoint() {
        let newAnchorPoint = CGPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
        redLayer.anchorPoint = newAnchorPoint

        print("New AnchorPoint: \(newAnchorPoint)")
        print("Frame after AnchorPoint change: \(redLayer.frame)")
    }
    // 改变 position
    func changePosition() {
        let newPosition = CGPoint(x: CGFloat.random(in: 50...250), y: CGFloat.random(in: 50...250))
        redLayer.position = newPosition

        print("New Position: \(newPosition)")
        print("Frame after Position change: \(redLayer.frame)")
    }
    // 改变 bounds
    func changeBounds() {
        let newBounds = CGRect(x: -50, y: 0, width: CGFloat.random(in: 50...150), height: CGFloat.random(in: 50...150))
        print("Old Bounds: \(redLayer.bounds)")
        redLayer.bounds = newBounds
        
        print("New Bounds: \(newBounds)")
        print("Frame after Bounds change: \(redLayer.frame)")
    }

    // 重置位置和大小
    func resetLayer() {
        redLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redLayer.position = CGPoint(x: 150, y: 150)
        redLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        print("Layer reset to default position and size")
    }
}

struct LayerView: UIViewRepresentable {
    @Binding var redLayer: CALayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.layer.addSublayer(redLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 可以在这里动态更新 CALayer 的属性
    }
}

#Preview {
    ContentView()
}
