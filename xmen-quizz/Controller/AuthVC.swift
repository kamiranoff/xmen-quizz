//
//  AuthVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 08/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func googleSignInBtnTapped(_ sender: Any) {
        //   GIDSignIn.sharedInstance().signIn()
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
