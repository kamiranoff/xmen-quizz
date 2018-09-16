//
//  Card.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 12/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class QuizzCell: UITableViewCell {
    
    @IBOutlet weak var backgroundVIew: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var difficultyLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundVIew.backgroundColor = UIColor(red: 10.0/255, green: 129.0/255, blue: 183.0/255, alpha: 1.0)
        backgroundVIew.layer.cornerRadius = 8
    
    }

    func updateViews(quizz: Quizz) {
        titleLbl.text = quizz.title
        difficultyLbl.text = "Difficulty: \(quizz.difficulty)"
    }
    
}
