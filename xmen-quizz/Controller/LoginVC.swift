//
//  LoginVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 08/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var closeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closeBtn.setTitle("\u{EA31}", for: .normal)
        closeBtn.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2.0)
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        if(emailTxt.text != nil && passwordTxt.text != nil) {
            AuthService.instance.loginUser(withEmail: emailTxt.text!, andPassword: passwordTxt.text!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    ErrorService.printError(err: error!)
                }
            }

        }
            }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
