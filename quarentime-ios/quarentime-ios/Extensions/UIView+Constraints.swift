//
//  UIView+Constraints.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 23/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviewAndConstrainToEdges(_ subview: UIView) {
        addSubviewAndConstrainToEdges(subview, insets: .zero)
    }
    
    func addSubviewAndConstrainToEdges(_ subview: UIView, insets: UIEdgeInsets) {
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: -insets.top)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: insets.bottom)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: -insets.left)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: insets.right)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([top, bottom, left, right])
    }
    
    func addSubviewAndConstrainToEdges(_ subview: UIView, withMargin margin: CGFloat) {
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: -margin)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: margin)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: -margin)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: margin)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([top, bottom, left, right])
    }
    
    func addSubviewAndConstrainToLeft(_ subview: UIView) {
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([top, bottom, left])
    }
    
    func addSubviewAndConstrainToRight(_ subview: UIView) {
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([top, bottom, right])
    }
    
    func addSubviewAndConstrainToBottom(_ subview: UIView, height: CGFloat, onCompletion: @escaping (NSLayoutConstraint) -> Void) {
        let heightConstraint = NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([heightConstraint, bottom, left, right])
        onCompletion(heightConstraint)
    }
    
    func addSubviewAndConstrainToBottomRight(_ subview: UIView, height: CGFloat, bottomInset: CGFloat, onCompletion: @escaping (NSLayoutConstraint) -> Void) {
        let heightConstraint = NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: bottomInset)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([heightConstraint, bottom, right])
        onCompletion(heightConstraint)
    }
    
    func addSubviewToVerticalStack(_ subview: UIView, topView: UIView, insets: UIEdgeInsets, isLastView: Bool = false) {
        let topSpace: CGFloat = insets.top
        var top = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: topSpace)
        if topView == self {
            top = NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: -topSpace)
        }
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: -insets.left)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: insets.right)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        if isLastView {
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: insets.bottom)
            NSLayoutConstraint.activate([top, bottom, left, right])
        } else {
            NSLayoutConstraint.activate([top, left, right])
        }
    }

    func addSubviewAndConstrainToTop(_ subview: UIView, height: CGFloat, onCompletion: ((NSLayoutConstraint) -> Void)? = nil) {
        let heightConstraint = NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([heightConstraint, top, left, right])
        onCompletion?(top)
    }
    
    func addSubviewAndConstrainToCenter(_ subview: UIView, width: CGFloat, height: CGFloat) {
        let y = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: subview, attribute: .centerY, multiplier: 1.0, constant: 0)
        let x = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: subview, attribute: .centerX, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: width)
        let heightConstraint = NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([x, y, widthConstraint, heightConstraint])
    }
    
    func addSubviewAndConstrainToCenter(_ subview: UIView, leftRightMargins: CGFloat) {
        let y = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: subview, attribute: .centerY, multiplier: 1.0, constant: 0)
        let x = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: subview, attribute: .centerX, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: leftRightMargins)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: -leftRightMargins)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([x, y, left, right])
    }
    
    func addSubviewAndConstraintToCenter(_ subview: UIView) {
        let y = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: subview, attribute: .centerY, multiplier: 1.0, constant: 0)
        let x = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: subview, attribute: .centerX, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([x, y])
    }
    
    func addSubviewAndConstraintToTopCenterX(_ subview: UIView, topSpacing: CGFloat = 0) {
        let top = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: topSpacing)
        let x = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: subview, attribute: .centerX, multiplier: 1.0, constant: 0)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([x, top])
    }
    
    func constraint(width: CGFloat) {
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: width)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([width])
    }
    
    func constraint(height: CGFloat) {
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: height)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([height])
    }
    
    func addSubviewAndConstrainToLeftBottomRight(_ subview: UIView, withMargin leftRight: CGFloat, bottom: CGFloat) {
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: bottom)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: subview, attribute: .left, multiplier: 1.0, constant: -leftRight)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: subview, attribute: .right, multiplier: 1.0, constant: leftRight)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([bottom, left, right])
    }
    
    func addSubViewAndConstraintToLeftRight(_ subview: UIView, leftRight: CGFloat) {
        let left = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: leftRight)
        let right = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -leftRight)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([left, right])
    }
}

extension UIView {
    
    var x: CGFloat {
        return frame.origin.x
    }
    
    var y: CGFloat {
        return frame.origin.y
    }
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
}
