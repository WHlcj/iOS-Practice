//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Changjun Li on 2022/12/9.
//

import Foundation

struct EmojiArtModel{
    var background = Background.blank
    var emojis = [Emoji]()   //for the UI to move them so it better not be set to private or private(set)
    
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int
        var y: Int
        var size: Int//This is a device and UI independent representation,someting like CGFLoat can't be accessed in Fondation
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) { //fileprivate means anyone in this file can use this
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    init() { }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y:Int), size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
    }
    
}
