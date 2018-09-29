//
//  QuestionScore.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 28/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

struct QuestionScore {
    private (set) var questionId: Int;
    private (set) var score: Int;
    
    static private var scoreMultiplier:Int = 100;
    
    init(questionId:Int, score: Int) {
        self.questionId = questionId
        self.score = score
    }
    
    static func setScore(counterTime: Int, timeToAnswer: Float, quizzDifficulty: Int, isRightAnswer: Bool ) -> Int {
        if(!isRightAnswer) {
            return -5 * QuestionScore.scoreMultiplier * quizzDifficulty;
        }
        
        let remainingTime:Int = counterTime - Int(roundf((timeToAnswer)))
        let multiplier:Int = remainingTime * QuestionScore.scoreMultiplier
        return multiplier * quizzDifficulty
        
    }
}
