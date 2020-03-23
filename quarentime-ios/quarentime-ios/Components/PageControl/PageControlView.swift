//
//  PageControlView.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class PageControlView: UIStackView, XibViewGettable, PageControlViewProtocol {
    
    var numberOfPages: Int = 0 {
        didSet {
            updateViews()
        }
    }
    
    var currentIndex: Int = 0 {
        didSet {
            updateSelection(with: oldValue)
        }
    }
    
    static func getView(itemsCount: Int) -> PageControlViewProtocol {
        let view = PageControlView()
        view.numberOfPages = itemsCount
        view.axis = .horizontal
        view.spacing = 6.0
        view.currentIndex = 0
        return view
    }
    
    private func updateViews() {
        for _ in 0...numberOfPages - 1 {
            let itemView = PageControlItem.getView()
            itemView.update()
            addArrangedSubview(itemView)
        }
    }
    
    private func updateSelection(with oldSelectedIndex: Int) {
        if oldSelectedIndex != currentIndex, oldSelectedIndex < numberOfPages {
            if let previousItem = subviews[oldSelectedIndex] as? PageControlItem {
                previousItem.isSelected = false
            }
        }
        if currentIndex < numberOfPages, let currentItem = subviews[currentIndex] as? PageControlItem {
            currentItem.isSelected = true
        }
    }
    
}
