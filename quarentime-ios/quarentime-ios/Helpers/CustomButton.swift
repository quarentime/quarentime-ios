//
//  CustomButton.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/1/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {
}


extension UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue //frame.width / 2
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    
    
    
    
}
