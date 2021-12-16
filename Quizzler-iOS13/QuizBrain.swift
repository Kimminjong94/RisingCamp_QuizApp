//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "12 x 2 = 24.", a: "True"),
        Question(q: "8+8 = 16.", a: "True"),
        Question(q: "23-3 = 20.", a: "True"),
        Question(q: "6 + 6 = 12", a: "True"),
        Question(q: "3-1 = 0.", a: "False"),
        Question(q: "6+6 = 12.", a: "True"),
        Question(q: "5-2 = 3", a: "False"),
        Question(q: "4+4 = 8", a: "True"),
        Question(q: "12+12 = 24'.", a: "True"),
        Question(q: "1-1 = 1", a: "False"),
        Question(q: "9-1 = 7", a: "False"),
        Question(q: "2+2 = 4", a: "True")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        
            if userAnswer == quiz[questionNumber].answer {
                score += 1
                return true
            } else {
                return false
            }
        
    }
}

