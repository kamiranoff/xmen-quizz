//
//  ViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 24/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.

import UIKit
import Firebase
import GoogleSignIn

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var settingLabel: UIBarButtonItem!
    @IBOutlet weak var quizzTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirestoreService.setup()
        
        settingLabel.title = "\u{EA30}"
       
        for controlState in [UIControl.State.normal, UIControl.State.disabled, UIControl.State.focused, UIControl.State.highlighted, UIControl.State.selected] {
            settingLabel.setTitleTextAttributes([
                NSAttributedString.Key.font : UIFont(name: "icons", size: 24)!,
                ], for: controlState)
        }
        
        quizzTable.delegate = self
        quizzTable.dataSource = self
        quizzTable.separatorColor = UIColor.clear

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = Auth.auth().currentUser;
        if  (user != nil) {
            self.welcomeLabel.text = "Welcome back, \(user!.displayName ?? "X-Man")"
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizzService.instance.getQuizzes().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let Cell = tableView.dequeueReusableCell(withIdentifier: "QuizzCell") as? QuizzCell {
            let quizz = QuizzService.instance.getQuizzes()[indexPath.row]
            Cell.updateViews(quizz: quizz)
            
            return Cell
        }
        
        return QuizzCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear

    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView:UIView =  UIView()
//        headerView.backgroundColor = UIColor.red
//        return headerView
//    }

}

