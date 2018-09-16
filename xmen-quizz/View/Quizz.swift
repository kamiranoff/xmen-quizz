//
//  Quizz.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 13/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

struct Quizz {
    private (set) var title:String
    private (set) var difficulty:Int
    private (set) var imageName:String?
    private (set) var description: String?
    private (set) var questions: [Question]
    
    init(title: String, difficulty: Int, questions: [Question]) {
        self.title = title
        self.difficulty = difficulty
        self.questions = questions
    }
    
    init(title: String, difficulty: Int, imageName: String, questions: [Question]) {
        self.title = title
        self.difficulty = difficulty
        self.imageName = imageName
        self.questions = questions
    }
    
    init(title: String, difficulty: Int, imageName: String, questions: [Question], description: String) {
        self.title = title
        self.difficulty = difficulty
        self.imageName = imageName
        self.questions = questions
        self.description = description
    }
}
