//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // 隐藏navigationbar（这里是隐藏后后续界面也不会出现navigationBar）
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    // 让后续界面继续出现navigationBar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        var charIndex = 0.0
        let titleString = K.appName
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { timer in
            for letter in titleString {
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                    self.titleLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
    }
    
}

