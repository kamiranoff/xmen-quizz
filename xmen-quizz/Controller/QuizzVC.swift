//
//  QuizzVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 16/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import ViewAnimator

class QuizzVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SRCountdownTimerDelegate {
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var quizzTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var counter: SRCountdownTimer? = SRCountdownTimer()
    
    var questionIndex: Int = 0;
    let timerTime:Int = 15;
    
    let animations = [AnimationType.from(direction: .right, offset: 30.0)]
    
    var quizz:Quizz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateQuizzContent(index: questionIndex)
        tableView.delegate = self;
        tableView.dataSource = self;
        counter?.delegate = self
        counter?.lineColor = Theme.XMen4
        counter?.lineWidth = 2.0
        counter?.trailLineColor = Theme.XMen
        
        
    }
    
    
    func timerDidEnd() {
        print("End")
        questionIndex = questionIndex + 1
        
        if(questionIndex <= quizz.questions.count) {
            updateQuizzContent(index: questionIndex)
        }
    }
    
    
    func updateQuizzContent(index:Int) {
        tableView.reloadData()
        quizzTitle.text = quizz.title
        questionTitle.text = quizz.questions[index].question
        counter?.start(beginingValue: timerTime)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizz.questions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as? QuestionCell {
            let index = indexPath.row
            let option = quizz.questions[questionIndex].options[index].option;
            cell.optionLbl.text = option;
            let delay = Double(index) * 0.075
            cell.animate(animations: animations,delay: delay)
            return cell;
        }
        
        return QuestionCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let optionId = quizz.questions[questionIndex].options[index].id;
        if(optionId == quizz.questions[questionIndex].answer) {
            print("Well Done")
        } else {
            print("Wrong!")
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}
