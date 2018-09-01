//
//  ViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 24/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    private var handleAuthState: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirestoreService.setup()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleAuthState = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            
//                self.present(loginViewController, animated: true, completion: nil)
            } else {
                print(user?.displayName ?? "something is wrong")
                if((user?.displayName) != nil) {
                    self.welcomeLabel.text = "Welcome back, \(user!.displayName ?? "X-Man")"
                    
                }
            }
            
        })
    }
    @IBAction func logoutTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch let signoutError as NSError {
            ErrorService.printError(err: signoutError)
        }
    }
}

