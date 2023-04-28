//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Changjun Li on 2023/4/27.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choice: [String]
    let answer: String
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choice = a
        self.answer = correctAnswer
    }
}
