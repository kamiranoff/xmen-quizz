//
//  SettingsVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 12/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SettingsVC: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.layer.cornerRadius = avatar.layer.frame.size.width / 2
        avatar.layer.borderWidth = 10
        avatar.layer.borderColor = UIColor(red: 10.0/255, green: 129.0/255, blue: 183.0/255, alpha: 1.0).cgColor
        avatar.layer.masksToBounds = true
        
    }
    
    func logoutSocial() {
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        for info in (user.providerData) {
            switch info.providerID {
            case GoogleAuthProviderID:
                GIDSignIn.sharedInstance()?.signOut()
            case FacebookAuthProviderID:
                print("fb");
            default:
                break
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                self.logoutSocial()
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        
        let dismiss = UIAlertAction(title: "No", style: .cancel, handler: nil)
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(dismiss)
        present(logoutPopup, animated: true, completion: nil)
    }
}
