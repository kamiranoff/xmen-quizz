//
//  LoginViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 24/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxt.layer.cornerRadius = 4
        passwordTxt.layer.cornerRadius = 4
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID

        GIDSignIn.sharedInstance()?.uiDelegate = self;
        GIDSignIn.sharedInstance().delegate = self;
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            return ErrorService.printError(err: error)
        }
        
        guard let authentication = user.authentication else {
            return
        }
        let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        firebaseLogin(credentials);
        
    }

    
    func firebaseLogin(_ credentials: AuthCredential) {
        Auth.auth().signInAndRetrieveData(with: credentials) { (user, error) in
            if let error = error {
                return ErrorService.printError(err: error)
            }
            self.dismiss(animated: true, completion: nil)
        }
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

    @IBAction func googleSignInBtnTapped(_ sender: Any) {
       // GIDSignIn.sharedInstance().signIn()
    }
}
