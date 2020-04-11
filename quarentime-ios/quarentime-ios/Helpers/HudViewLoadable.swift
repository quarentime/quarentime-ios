//
//  HudViewLoadable.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 8/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

public protocol HudViewLoadable {}

extension HudViewLoadable where Self : UIViewController  {
    
    func showActivityIndicator(with delay: Double = 0.02) {
        loadingAnimation(with: delay)
    }
    
    func showBlurActivityIndicator() {
        let blurHudView = initialBlurHudView()
        view.bringSubviewToFront(blurHudView)
    }
    
    func hideActivityIndicator() {
        hudView?.removeFromSuperview()
        blurHudView?.removeFromSuperview()
    }
    
    private func loadingAnimation(with delayTime: Double) {
        let hudView = initialHudView()
        if delayTime > 0 {
            hudView.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            if let hudView = self.hudView {
                self.view.bringSubviewToFront(hudView)
                hudView.isHidden = false
            }
        }
    }
    
    private var hudView: HudView? {
        return view.subviews.filter { $0 is HudView }.first as? HudView
    }
    
    private var blurHudView: BlurHudView? {
        return view.subviews.filter { $0 is BlurHudView }.first as? BlurHudView
    }
    
    private func initialHudView() -> HudView {
        let hudView = HudView.defaultHudView()
        view.addSubviewAndConstraintToCenter(hudView)
        return hudView
    }
    
    private func initialBlurHudView() -> BlurHudView {
        let hudView = BlurHudView()
        view.addSubviewAndConstraintToCenter(hudView)
        return hudView
    }
    
}

extension HudViewLoadable where Self: UIView {
    
    func showActivityIndicator() {
        let hudView = HudView.hudView(with: UIColor.systemPink)
        addSubviewAndConstraintToCenter(hudView)
    }
    
    func hideActivityIndicator() {
        subviews.filter { $0 is HudView }.forEach { $0.removeFromSuperview() }
    }
}

