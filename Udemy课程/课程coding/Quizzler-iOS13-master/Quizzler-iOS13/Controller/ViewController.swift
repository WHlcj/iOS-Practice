//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // 验证答案
        guard let userAnswer = sender.currentTitle else { return }
        sender.backgroundColor = quizBrain.checkAnswer(userAnswer)
        quizBrain.nextQuestion()
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
            self.updateUI()
        }
    }
    
    func updateUI() {
        // 刷新选项
        let answerChoices = quizBrain.getChoiceText()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        // 刷新进度条
        progressBar.progress = quizBrain.getProgress()
        // 刷新问题
        questionLabel.text = quizBrain.getQuestionText()
        // 刷新分数
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        // 清除背景色
        choice1.backgroundColor = .clear
        choice2.backgroundColor = .clear
        choice3.backgroundColor = .clear
    }
    
}

