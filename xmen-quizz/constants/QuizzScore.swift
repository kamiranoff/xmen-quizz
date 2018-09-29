//
//  QuizzScore.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 28/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

struct QuizzScore {
    private (set) var quizzId: Int;
    private (set) var questionsScore: [QuestionScore]
    private (set) var totalScore: Int;
    
    init(quizzId:Int, totalScore: Float, questionsScore:[QuestionScore]) {
        self.quizzId = quizzId
        self.questionsScore = questionsScore
        self.totalScore = QuizzScore.computeTotalScore(questionsScore: questionsScore)
    }
    
    private static func computeTotalScore(questionsScore: [QuestionScore]) -> Int {
        var totalScore = 0;
        
        for questionScore in questionsScore {
            totalScore = totalScore + questionScore.score
        }
        
        return totalScore;
    }
}
