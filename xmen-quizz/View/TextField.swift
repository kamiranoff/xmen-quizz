//
//  TextField.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 25/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 4
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 4

    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: padding.top)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: padding.top)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding.left, dy: padding.top)
    }
    

    
}
