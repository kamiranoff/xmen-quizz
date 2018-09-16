//
//  QuizzService.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 13/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation

let options1 = [Option(option: "Logan", id: 1), Option(option: "Hank", id: 2), Option(option: "Scott", id: 3), Option(option: "Alex", id: 4)]
let options2 = [Option(option: "Cyclops", id: 1), Option(option: "Wolverine", id: 2), Option(option: "Angel", id: 3), Option(option: "Iceman", id: 4)]
let options3 = [Option(option: "Magneto", id: 1), Option(option: "Jean Grey", id: 2), Option(option: "Wolverine", id: 3), Option(option: "Omega Red", id: 4)]
let options4 = [Option(option: "Spider-man # 3", id: 1), Option(option: "X-Force # 5", id: 2), Option(option: "X-Men # 12", id: 3), Option(option: "Avengers # 2", id: 4)]

private let questions1 = [
    Question(question: "What is Wolverine real name?", answer: 1, options: options1),
    Question(question: "Who was not one of the first X-Men?", answer: 2, options: options2),
    Question(question: "Sabretooth's archenemy is:", answer: 3, options: options3),
    Question(question: "Juggernaut first appeared in:", answer: 3, options: options4)
]

private let quizzes = [
    Quizz(title: "Quizz 1", difficulty: 1, questions: questions1),
    Quizz(title: "Quizz 2", difficulty: 1, questions: questions1),
    Quizz(title: "Quizz 3", difficulty: 1, questions: questions1),
    Quizz(title: "Quizz 4", difficulty: 1, questions: questions1)
]


class QuizzService {
    static let instance = QuizzService()


    func getQuizzes() -> Array<Quizz> {
        return quizzes
    }
}
