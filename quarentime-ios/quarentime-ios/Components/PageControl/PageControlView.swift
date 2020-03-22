//
//  PageControlView.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//
import Foundation

import UIKit

final class PageControlView: UIStackView, PageControlViewProtocol {
    
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
        view.updateViews()
        view.axis = .horizontal
        view.spacing = 6.0
        view.currentIndex = 0
        return view
    }
    
    private func updateViews() {
        subviews.forEach { $0.removeFromSuperview() }
        for _ in 0...numberOfPages - 1 {
//            addArrangedSubview(PageControlItem.getView())
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
