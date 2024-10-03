//
//  ViewController.swift
//  offScreenRenderingDemo
//
//  Created by Changjun Li on 2024/10/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 圆角和 maskToBounds 会触发性能问题
        let cornerRadiusView = UIView(frame: CGRect(x: 20, y: 100, width: 150, height: 150))
        cornerRadiusView.backgroundColor = .systemBlue
        cornerRadiusView.layer.cornerRadius = 20
        cornerRadiusView.layer.masksToBounds = true // 圆角 + maskToBounds 触发离屏渲染
        self.view.addSubview(cornerRadiusView)

        // 遮罩 (mask) 会触发离屏渲染
        let maskedView = UIView(frame: CGRect(x: 200, y: 100, width: 150, height: 150))
        maskedView.backgroundColor = .systemPink
        let maskLayer = CALayer()
        maskLayer.frame = maskedView.bounds
        maskLayer.contents = UIImage(named: "maskImage")?.cgImage // 使用自定义遮罩图片
        maskedView.layer.mask = maskLayer
        self.view.addSubview(maskedView)

        // 阴影会触发离屏渲染
        let shadowView = UIView(frame: CGRect(x: 20, y: 300, width: 150, height: 150))
        shadowView.backgroundColor = .white
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        shadowView.layer.shadowOpacity = 0.8
        shadowView.layer.shadowRadius = 10
        self.view.addSubview(shadowView)

        // 光栅化
        let rasterizedView = UIView(frame: CGRect(x: 200, y: 300, width: 150, height: 150))
        rasterizedView.backgroundColor = .systemGreen
        rasterizedView.layer.shouldRasterize = true // 光栅化，会缓存位图以提升性能
        rasterizedView.layer.rasterizationScale = UIScreen.main.scale // 设置光栅化的比例
        self.view.addSubview(rasterizedView)

        // 抗锯齿 (shouldRasterize 也会开启抗锯齿)
        let antiAliasedView = UIView(frame: CGRect(x: 20, y: 500, width: 150, height: 150))
        antiAliasedView.backgroundColor = .systemYellow
        antiAliasedView.layer.borderWidth = 1.0
        antiAliasedView.layer.borderColor = UIColor.red.cgColor
        antiAliasedView.layer.allowsEdgeAntialiasing = true // 开启抗锯齿
        self.view.addSubview(antiAliasedView)

        // 渐变色
        let gradientView = UIView(frame: CGRect(x: 200, y: 500, width: 150, height: 150))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // 渐变颜色
        gradientView.layer.addSublayer(gradientLayer)
        self.view.addSubview(gradientView)

        // 透明视图 (opaque)
        let opaqueView = UIView(frame: CGRect(x: 20, y: 700, width: 150, height: 150))
        opaqueView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(opaqueView)
    }
}
