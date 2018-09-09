//
//  RegisterUserVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 09/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class RegisterUserVC: UIViewController {
    @IBOutlet weak var emailTxt: TextField!
    @IBOutlet weak var passwordTxt: TextField!
    @IBOutlet weak var usernameTxt: TextField!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeBtn.setTitle("\u{EA31}", for: .normal)
        closeBtn.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2.0)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let email = emailTxt.text
        let password = passwordTxt.text
        let username = usernameTxt.text
        
        if(
            email != nil &&
            password != nil &&
            username != nil
            ) {
            AuthService.instance.registerUser(withEmail: email!, andPassword: password!, andUsername: username!) { (success, error) in
                if(success) {
                    AuthService.instance.loginUser(withEmail: email!, andPassword: password!, loginComplete: { (success, error) in
                        if(error != nil) {
                            return ErrorService.printError(err: error!)
                        }
                        self.dismiss(animated: true, completion: nil)
                    })
                } else {
                    return ErrorService.printError(err: error!)
                }
            }
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
