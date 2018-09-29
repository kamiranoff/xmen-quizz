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
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet var counter: SRCountdownTimer? = SRCountdownTimer()
    
    var questionIndex: Int = 0;
    let timerTime:Int = 15;
    var quizz:Quizz!
    var quizzScore:Int = 0;
    
    let animations = [AnimationType.from(direction: .right, offset: 30.0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuizzContent(index: questionIndex)
        
        tableView.delegate = self;
        tableView.dataSource = self;
        counter?.delegate = self
        counter?.lineColor = Theme.XMen4
        counter?.lineWidth = 2.0
        counter?.trailLineColor = Theme.XMen
    }
    
    func timerDidEnd() {
        if(questionIndex < quizz.questions.count - 1) {
            questionIndex = questionIndex + 1
            updateQuizzContent(index: questionIndex)
        }
    }
    
    func updateQuizzContent(index:Int) {
        tableView.reloadData()
        quizzTitle.text = quizz.title
        questionTitle.text = quizz.questions[index].question
        counter?.start(beginingValue: timerTime)
    }
    
    func updateUIForRightAnswer() {
        
    }
    
    func updateUIForWrongAnswer() {
        
    }
    
    func didSelectectAnswer(isRightAnswer:Bool) {
        let difficulty = quizz?.difficulty ?? 1;
        let timeElapsed = counter?.elapsedTime ?? 1;
        
        let currentQuestionScore = QuestionScore.setScore(counterTime: timerTime, timeToAnswer: Float(timeElapsed) , quizzDifficulty: difficulty , isRightAnswer: isRightAnswer)
        let questionScore = QuestionScore(questionId: questionIndex, score: currentQuestionScore)
        
        quizzScore = quizzScore + questionScore.score
        totalScore.text = "Score: \(quizzScore)"
    
        if(isRightAnswer) {
            updateUIForRightAnswer()
        } else {
            updateUIForWrongAnswer()
        }
       
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.counter?.end()
        }
    }
}

extension QuizzVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizz.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as? QuestionCell {
            let index = indexPath.row
            let option = quizz.questions[questionIndex].options[index].option;
            cell.optionLbl.text = option;
            cell.selectionStyle = .none
            let delay = Double(index) * 0.075
            cell.animate(animations: animations,delay: delay)
            cell.optionLbl.backgroundColor = Theme.XMen

            return cell;
        }
        return QuestionCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let optionId = quizz.questions[questionIndex].options[index].id;
        let cell:QuestionCell = tableView.cellForRow(at: indexPath) as! QuestionCell
        
        if(optionId == quizz.questions[questionIndex].answer) {
            didSelectectAnswer(isRightAnswer: true)
            cell.optionLbl.backgroundColor = UIColor.green

        } else {
            didSelectectAnswer(isRightAnswer: false)
            cell.optionLbl.backgroundColor = Theme.XMen5

        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}
