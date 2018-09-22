//
//  QuestionCell.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 21/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var optionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        optionLbl.backgroundColor = UIColor(red: 10.0/255, green: 129.0/255, blue: 183.0/255, alpha: 1.0)
        optionLbl.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
