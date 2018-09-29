//
//  User.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 28/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

struct Player {
    private (set) var username: String
    private var quizzesScore: [QuizzScore]
    private var totalScore: Float
    
    init(username:String) {
        self.username = username;
        self.totalScore = 0
        self.quizzesScore = []
    }
}
