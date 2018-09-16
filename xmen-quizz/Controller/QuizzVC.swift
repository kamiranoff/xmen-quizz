//
//  QuizzVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 16/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class QuizzVC: UIViewController {

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var quizzTitle: UILabel!
    
    
    var quizz:Quizz!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initQuizz()
    }
    
    
    func initQuizz() {
        quizzTitle.text = quizz.title
        questionTitle.text = quizz.questions[0].question
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
