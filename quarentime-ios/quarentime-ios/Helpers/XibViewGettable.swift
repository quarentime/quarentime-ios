//
//  XibViewGettable.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

protocol XibViewGettable where Self: UIView {}

extension XibViewGettable {
    
    private static func getViewFromXib<T: UIView>() -> T {
        let name = String(describing: T.self)
        if let view = Bundle(for: self).loadNibNamed(name, owner: self, options: nil)?.first as? T {
            return view
        }
        fatalError("Can't find xib file")
    }
    
    static func getView() -> Self {
        return getViewFromXib()
    }
    
}
