//
//  QuizzVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 16/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import ViewAnimator

class QuizzVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var quizzTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let animations = [AnimationType.from(direction: .right, offset: 30.0)]

    var quizz:Quizz!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        initQuizz()
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    
    func initQuizz() {
        quizzTitle.text = quizz.title
        questionTitle.text = quizz.questions[0].question
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let quizz = quizz {
            return quizz.questions.count
        }
        
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as? QuestionCell {
            let index = indexPath.row
            if let quizz = quizz {
                let option = quizz.questions[0].options[index].option;
                cell.button.setTitle(option, for: .normal);
                let delay = Double(index) * 0.075
                cell.animate(animations: animations,delay: delay)
                return cell;
            }
        }
    
        return QuestionCell()
    }

}
