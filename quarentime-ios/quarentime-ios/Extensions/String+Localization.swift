//
//  String+Extension.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation

extension String {
    
    var local: String {
        return NSLocalizedString(self, tableName: "Localizable", value: "\(self)", comment: "")
    }
    
}
