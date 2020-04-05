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
    
    @IBInspectable public var borderColor: UIColor? = nil {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateUI()
    }
    
    private func updateUI() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor ?? tintColor.cgColor
        
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
    }
}
