//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Changjun Li on 2023/4/30.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?


    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
