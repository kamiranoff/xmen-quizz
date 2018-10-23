//
//  EndOfQuizzVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 02/10/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class EndOfQuizzVC: UIViewController {

    @IBOutlet weak var BackToHomeBtn: UIButton!
    
    
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
    @IBAction func onPressedBackToButton(_ sender: Any) {
        let navigationController = self.presentingViewController as? UINavigationController

        self.dismiss(animated: true) {
            let _ = navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
