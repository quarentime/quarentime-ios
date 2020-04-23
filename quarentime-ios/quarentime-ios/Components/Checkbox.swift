//
//  Checkbox.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/13/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                let image = UIImage(systemName: "checkmark")
                setImage(image, for: .normal)
            } else {
                layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                layer.borderWidth = 1.0
            }
        }
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 4.0
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender:UIButton) {
        if(sender == self){
            if isChecked {
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
}
