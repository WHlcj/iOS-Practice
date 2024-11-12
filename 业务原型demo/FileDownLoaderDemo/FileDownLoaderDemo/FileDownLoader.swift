//
//  FileDownLoader.swift
//  FileDownLoaderDemo
//
//  Created by Changjun Li on 2024/11/12.
//

import Foundation

class FileDownloader {
    let fileURL: URL
    let fileSize: Int
    let chunkSize: Int = 1024 * 1024  // 每个数据包大小（例如1MB）
    var downloadedChunks = [Int: Data]()
    let downloadQueue = DispatchQueue(label: "fileDownloadQueue", attributes: .concurrent)
    let dispatchGroup = DispatchGroup()
    
    init(fileURL: URL, fileSize: Int) {
        self.fileURL = fileURL
        self.fileSize = fileSize
    }
    
    func startDownload(completion: @escaping (Data?) -> Void) {
        let totalChunks = Int(ceil(Double(fileSize) / Double(chunkSize)))
        
        for chunkIndex in 0..<totalChunks {
            dispatchGroup.enter()
            downloadChunk(at: chunkIndex) { data in
                if let data = data {
                    self.downloadQueue.async(flags: .barrier) {
                        self.downloadedChunks[chunkIndex] = data
                    }
                }
                self.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            let mergedData = self.mergeChunks(totalChunks: totalChunks)
            completion(mergedData)
        }
    }
    
    private func downloadChunk(at index: Int, completion: @escaping (Data?) -> Void) {
        let start = index * chunkSize
        let end = min((index + 1) * chunkSize - 1, fileSize - 1)
        var request = URLRequest(url: fileURL)
        request.setValue("bytes=\(start)-\(end)", forHTTPHeaderField: "Range")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
                print("Failed to download chunk \(index): \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    private func mergeChunks(totalChunks: Int) -> Data? {
        var mergedData = Data()
        for index in 0..<totalChunks {
            if let chunkData = downloadedChunks[index] {
                mergedData.append(chunkData)
            } else {
                print("Missing chunk \(index)")
                return nil
            }
        }
        return mergedData
    }
}

