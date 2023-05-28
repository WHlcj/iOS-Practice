//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CoinVC: UIViewController {
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var coinPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager.delegate = self
        coinPicker.dataSource = self
        coinPicker.delegate = self
    }
}

// MARK: - UIPickerView DataSource & Delegate
extension CoinVC: UIPickerViewDataSource, UIPickerViewDelegate {
    // 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }

    // 列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    // 选取值
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }

    // 选取完成
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.inquireCoinPrice(coinManager.currencyArray[row])
    }
}

// MARK: - CoinManagerDelegate
extension CoinVC: CoinManagerDelegate {
    func didUpdateCoin(coin: String, rate: String) {
        DispatchQueue.main.async {
            self.rateLabel.text = rate
            self.coinLabel.text = coin
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
        print("获取信息失败!")
    }
}
