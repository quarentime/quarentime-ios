//
//  PageControlItem.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation
import UIKit

final class PageControlItem: UIView, XibViewGettable {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    var isSelected: Bool = false {
        didSet {
            update()
        }
    }
    
    func update() {
        isSelected ? select() : deSelect()
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.60, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: { [weak self] in
            guard let self = self else { return }
            self.layoutIfNeeded()
        })
    }
    
    private func select() {
        self.containerView.backgroundColor = .black
    }
    
    private func deSelect() {
        self.containerView.backgroundColor = .lightGray
    }
    
}
