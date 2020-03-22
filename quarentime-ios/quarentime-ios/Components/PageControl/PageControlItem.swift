//
//  PageControlItem.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation
import UIKit

final class PageControlItem: UIView {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    var isSelected: Bool = false {
        didSet {
            update()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.backgroundColor = .gray
        layer.cornerRadius = 3
        layer.masksToBounds = true
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
        self.widthConstraint.constant = 20
    }
    
    private func deSelect() {
        self.containerView.backgroundColor = .gray
        self.widthConstraint.constant = 6
    }
    
}
