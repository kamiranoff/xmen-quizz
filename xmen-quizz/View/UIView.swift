//
//  UIView.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 02/10/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.2, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            self.frame = CGRect(x: 100, y: 8, width: self.frame.width, height: self.frame.height - 30.0)
        }, completion: completion)
    }
}
