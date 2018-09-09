//
//  AuthVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 08/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import GoogleSignIn
class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if AuthService.instance.getCurrentUser() != nil {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func googleSignInBtnTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func signInWithEmailPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    

    @IBAction func CreateAccountPressed(_ sender: Any) {
        let registerUserVC = storyboard?.instantiateViewController(withIdentifier: "RegisterUserVC")
        present(registerUserVC!, animated: true, completion: nil)
    }
}
