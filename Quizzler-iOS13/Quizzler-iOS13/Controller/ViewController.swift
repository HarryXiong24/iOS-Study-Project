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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = 1.0 / Float(quizBrain.quiz.count)
        answerLabel.text = "Choose your answer"
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        let userAnswer = sender.currentTitle;
        
        let isTrue =  quizBrain.checkAnswer(userAnswer!);
        
        if isTrue {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        answerLabel.text = "Right Answer is \(quizBrain.getRigntAnswer())"
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        answerLabel.text = "Choose your answer"
    }
    
}

