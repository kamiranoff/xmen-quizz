//
//  CreateUserViewController.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 25/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import Firebase

class CreateUserViewController: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxt.layer.cornerRadius = 4
        passwordTxt.layer.cornerRadius = 4
        usernameTxt.layer.cornerRadius = 4
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        
        guard let email = emailTxt.text,
            let password = passwordTxt.text,
            let username = usernameTxt.text
            else{ return}
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                return ErrorService.printError(err: error)
            }
            
            let changeRequest = user?.user.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error {
                    return ErrorService.printError(err: error)
                }
                
                guard let userID = user?.user.uid else {return }
                Firestore.firestore().collection(USERS_REF).document(userID).setData([
                    USERNAME: username,
                    DATE_CREATED: FieldValue.serverTimestamp()
                    ], completion: { (error) in
                        if let error = error {
                            return ErrorService.printError(err: error)
                        }
                        
                        self.dismiss(animated: true, completion:nil)
                })
            })
            
        }
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
}
