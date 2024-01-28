//
//  ViewController.swift
//  UrlSchemeDemoSwift
//
//  Created by Changjun Li on 2024/1/2.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let infoLabel = UILabel()
    let jumpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    @objc func onClickedJumpButton() {
        let urlString = "ocDemo://?user=elee"
        guard let url = URL(string: urlString) else {
            self.infoLabel.text = "url不存在"
            return
        }
        guard UIApplication.shared.canOpenURL(url) else {
            self.infoLabel.text = "目标app不存在 or 不在白名单"
            return
        }
        UIApplication.shared.open(url) { success in
            if !success {
                self.infoLabel.text = "跳转失败"
            }
        }
    }
    
    func initUI() {
        self.view.addSubview(infoLabel)
        self.view.addSubview(jumpButton)
        
        infoLabel.text = "这是SwiftDemo"
        infoLabel.font = UIFont.systemFont(ofSize: 17)
        infoLabel.numberOfLines = 0
        infoLabel.textColor = UIColor.systemGray
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(jumpButton.snp.top)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        jumpButton.setTitle("跳转", for: .normal)
        jumpButton.layer.cornerRadius = 15
        jumpButton.tintColor = UIColor.white
        jumpButton.backgroundColor = UIColor.purple
        jumpButton.addTarget(self, action: #selector(onClickedJumpButton), for: .touchUpInside)
        jumpButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }

}

