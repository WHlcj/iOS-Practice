//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by Changjun Li on 2022/12/9.
//

import Foundation

extension EmojiArtModel {
    enum Background {
        case blank
        case url(URL)
        case imageData(Data)
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageDate: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
    
    
    
    
}
