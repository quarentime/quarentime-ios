//
//  PageControlViewProtocol.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation
import UIKit

protocol PageControlViewProtocol where Self: UIView {
    
    var currentIndex: Int { get set }
    var numberOfPages: Int { get set }
    static func getView(itemsCount: Int) -> PageControlViewProtocol
    
}
