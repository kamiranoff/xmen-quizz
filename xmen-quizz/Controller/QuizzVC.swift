//
//  QuizzVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 16/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import ViewAnimator
import Lottie

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
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "EndOfQuizz") as! EndOfQuizzVC
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            present(destinationViewController, animated: true, completion: nil)

        }
    }
    
    func updateQuizzContent(index:Int) {
        tableView.reloadData()
        tableView.isUserInteractionEnabled = true;
        quizzTitle.text = quizz.title
        questionTitle.text = quizz.questions[index].question
        counter?.start(beginingValue: timerTime)
    }
    
    func updateUIForRightAnswer(cell: QuestionCell, questionScore: Int) {
        cell.optionLbl.backgroundColor = Theme.XMen7
        let animationView = LOTAnimationView(name: "confetti")
        let scoreUpdateView = UILabel(frame: CGRect(x: 120, y: 8, width: 50, height: 30))
        scoreUpdateView.text = "+\(questionScore)"
        scoreUpdateView.textColor = Theme.XMen4
        scoreUpdateView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            scoreUpdateView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }
      
    
        scoreUpdateView.fadeIn(completion: {
            (finished: Bool) -> Void in
            scoreUpdateView.fadeOut()
        })
        self.view.addSubview(scoreUpdateView)
        self.view.addSubview(animationView)
        animationView.isUserInteractionEnabled = false
        animationView.play{ (finished) in
            animationView.removeFromSuperview()
        }
    }
    
    func updateUIForWrongAnswer(cell: QuestionCell, questionScore: Int) {
        cell.optionLbl.backgroundColor = Theme.XMen5
        
    }
    
    func didSelectectAnswer(isRightAnswer:Bool, cell: QuestionCell) {
        let difficulty = quizz?.difficulty ?? 1;
        let timeElapsed = counter?.elapsedTime ?? 1;
        
        let currentQuestionScore = QuestionScore.setScore(counterTime: timerTime, timeToAnswer: Float(timeElapsed) , quizzDifficulty: difficulty , isRightAnswer: isRightAnswer)
        let questionScore = QuestionScore(questionId: questionIndex, score: currentQuestionScore)
        
        quizzScore = quizzScore + questionScore.score
        totalScore.text = "Score: \(quizzScore)"
        
        if(isRightAnswer) {
            updateUIForRightAnswer(cell: cell, questionScore: questionScore.score)
        } else {
            updateUIForWrongAnswer(cell: cell, questionScore: questionScore.score)
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
        tableView.isUserInteractionEnabled = false;

        if(optionId == quizz.questions[questionIndex].answer) {
            self.didSelectectAnswer(isRightAnswer: true, cell: cell)
            
        } else {
            didSelectectAnswer(isRightAnswer: false, cell: cell)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}
