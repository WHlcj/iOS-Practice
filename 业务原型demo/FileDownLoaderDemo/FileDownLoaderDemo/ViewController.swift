//
//  ViewController.swift
//  FileDownLoaderDemo
//
//  Created by Changjun Li on 2024/11/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let fileURL = URL(string: "https://example.com/largefile") {
            let downloader = FileDownloader(fileURL: fileURL, fileSize: 50 * 1024 * 1024)  // 假设文件大小为50MB
            downloader.startDownload { data in
                if let data = data {
                    print("文件下载完成，大小：\(data.count)字节")
                    // 处理下载的数据，例如保存到本地文件
                } else {
                    print("下载失败")
                }
            }
        }
    }


}

