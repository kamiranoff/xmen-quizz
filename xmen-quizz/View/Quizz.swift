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
    
    
    init(title: String, difficulty: Int) {
        self.title = title
        self.difficulty = difficulty
    }
    
    init(title: String, difficulty: Int, imageName: String) {
        self.title = title
        self.difficulty = difficulty
        self.imageName = imageName
    }
}
