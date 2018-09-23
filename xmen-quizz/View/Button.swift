//
//  Button.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 12/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class Button: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.contentEdgeInsets.left = 26
        self.showsTouchWhenHighlighted = true
        
        self.addBottomBorderWithColor(color: Theme.XMen, width: 1.0)
        self.addTopBorderWithColor(color: Theme.XMen, width: 1.0)

    }

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let bounds = UIScreen.main.bounds
        let lineView = UIView(frame: CGRect(x: 0, y: self.frame.size.height, width: bounds.size.width, height: width))
        lineView.backgroundColor=color
        self.addSubview(lineView)
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let bounds = UIScreen.main.bounds
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: width))
        lineView.backgroundColor=color
        self.addSubview(lineView)
    }
    
}
