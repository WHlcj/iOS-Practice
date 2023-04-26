//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    var totalTime = 0
    
    var player: AVAudioPlayer?
    var timer = Timer()
    
    @IBOutlet weak var timerMessage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func pressedButton(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        guard let hardness = sender.currentTitle else { return }
        totalTime = eggTimes[hardness]!
        secondsRemaining = eggTimes[hardness]!
//        progressBar.setProgress(Float(eggTimes[hardness]! - secondsRemaining / eggTimes[hardness]!), animated: true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            if self.secondsRemaining > 0 {
//                print("\(self.secondsRemaining) seconds.")
//                self.secondsRemaining -= 1
//            }
////            self.updateTimer()
//        }
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            progressBar.progress = Float(totalTime-secondsRemaining) / Float(totalTime)
            timerMessage.text = "\(secondsRemaining) seconds."
            if secondsRemaining == 0 {
                timerMessage.text = "完成"
                playSound()
            }
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error)
        }
    }
}
