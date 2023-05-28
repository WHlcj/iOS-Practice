//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(coin: String, rate: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "B79B23E2-2F55-4212-AD75-14FF91A30D66"     //YOUR_API_KEY_HERE
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func inquireCoinPrice(_ coin: String) {
        print("查询成功\(coin)")
        let urlString = "\(baseURL)/\(coin)?apikey=\(apiKey)"
        print(urlString)
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, respinse, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }

                if let safaData = data {
                    if let rate = self.parseJSON(safaData) {
                        delegate?.didUpdateCoin(coin: coin, rate: rate)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    private func parseJSON(_ coinData: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            return String(format: "%.2f", decodedData.rate)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

