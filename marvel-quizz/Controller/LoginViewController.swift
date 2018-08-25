//
//  LoginViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 24/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxt.layer.cornerRadius = 4
        passwordTxt.layer.cornerRadius = 4

    }
    
 
    @IBAction func loginBtnTapped(_ sender: Any) {
        guard let email = emailTxt.text,
            let password = passwordTxt.text else {
                return
        }
        Auth.auth().signIn(withEmail: email , password: password) { (user, error) in
            if let error = error {
                return ErrorService.printError(err: error)
            }
            self.dismiss(animated: true, completion: nil)
        }
    }

}
