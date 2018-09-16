//
//  ViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 24/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.

import UIKit
import Firebase
import GoogleSignIn

class MainViewController: UIViewController  {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var settingLabel: UIBarButtonItem!
    
    var quizzTable:QuizzTableVC?
    
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

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = Auth.auth().currentUser;
        if  (user != nil) {
            self.welcomeLabel.text = "Welcome back, \(user!.displayName ?? "X-Man")"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let QuizzVC = segue.destination as? QuizzVC {
            QuizzVC.quizz = sender as? Quizz
        }
    }
}

