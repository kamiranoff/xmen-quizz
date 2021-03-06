//
//  Question.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 13/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

//question: String,
//pictureUrl: String,
//options: [{
//option: String,
//id: Number,
//_id: false
//}],
//answer: Number,

struct Option {
    private (set) var option: String
    private (set) var id: Int

    init(option: String, id: Int) {
        self.option = option
        self.id = id
    }
}

struct Question {
    private (set) var question: String
    private (set) var pictureUrl: String?
    private (set) var answer: Int
    private (set) var options: [Option]
    
    
    init(question: String, answer:Int, options: [Option]) {
        self.question = question
        self.answer = answer
        self.options = options
        self.pictureUrl = nil
    }
    
    init(question: String, answer:Int, options: [Option], pictureUrl: String) {
        self.question = question
        self.answer = answer
        self.options = options
        self.pictureUrl = pictureUrl
    }
}
