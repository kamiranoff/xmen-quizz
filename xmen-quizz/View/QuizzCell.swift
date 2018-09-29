//
//  Card.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 12/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class QuizzCell: UITableViewCell {
    
    var index: Int?
    @IBOutlet weak var backgroundVIew: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var difficultyLbl: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundVIew.backgroundColor = UIColor(red: 10.0/255, green: 129.0/255, blue: 183.0/255, alpha: 1.0)
        backgroundVIew.layer.cornerRadius = 8
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration:0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseOut,
                       animations: {
                       self.transform = CGAffineTransform.identity
        }, completion: nil)
        // Configure the view for the selected state
    }

    func updateViews(quizz: Quizz) {
        titleLbl.text = quizz.title
        difficultyLbl.text = "Difficulty: \(quizz.difficulty)"
        
        if let imageName = quizz.imageName {
            imageOutlet.image = UIImage(named: imageName)
            imageOutlet.contentMode = .scaleAspectFit

        }
    }
    
    
    
}
