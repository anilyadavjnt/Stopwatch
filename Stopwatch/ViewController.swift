//
//  ViewController.swift
//  Stopwatch
//
//  Created by Anil Yadav on 19/02/25.
//  Email: anilyadavjnt@gmail.com
//  Contact No: +91-975211420
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        startButton.layer.cornerRadius = 20
        pauseButton.layer.cornerRadius = 20
        resetButton.layer.cornerRadius = 20
        timerLabel.layer.shadowOffset = CGSize.init(width: 2, height: 5)
        timerLabel.layer.borderWidth = 1
        timerLabel.layer.borderColor = UIColor.purple.cgColor
        timerLabel.layer.cornerRadius = 10
    }
    // Mark: Action Button
    @IBAction func resetTap(_ sender: Any) {
        
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        resetButton.alpha = 0.5
        startButton.alpha = 0.5
        pauseButton.alpha = 0.5
        
    }
    
    @IBAction func pauseTap(_ sender: Any) {
        
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        resetButton.alpha = 1.0
        startButton.alpha = 1.0
        pauseButton.alpha = 0.5
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func startTap(_ sender: Any) {
        
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
            
            resetButton.alpha = 1.0
            startButton.alpha = 0.5
            pauseButton.alpha = 1.0
            
        }
    }
    
    // Mark: Running Mathods
    @objc func runTimer() {
        counter += 0.1
        timerLabel.text = "\(counter)"
        
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        let decisecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
        
    }
    
}
