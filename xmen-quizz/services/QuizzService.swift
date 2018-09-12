//
//  QuizzService.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 13/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

class QuizzService {
    static let instance = QuizzService()
    
    private let quizzes = [
        Quizz(title: "Quizz 1", difficulty: 1),
        Quizz(title: "Quizz 2", difficulty: 1),
        Quizz(title: "Quizz 3", difficulty: 1),
        Quizz(title: "Quizz 4", difficulty: 1)
    ]
    
    func getQuizzes() -> Array<Quizz> {
        return quizzes
    }
}
