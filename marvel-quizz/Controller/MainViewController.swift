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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirestoreService.setup()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("error")
//        }

        handleAuthState = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC")
                self.present(loginViewController, animated: true, completion: nil)
            } else {
                print(user?.displayName ?? "something is wrong")
            }
            
        })
    }
}

