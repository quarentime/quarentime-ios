//
//  LaunchCoordinator.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 31/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit
import Firebase

struct LaunchCoordinator {
    
    static let shared = LaunchCoordinator()
    
    private init() {
        initializeThirdPartyLibraries()
    }
    
    private func initializeThirdPartyLibraries() {
        // Do shitty configs for frameworks (if possible in background thread)
        FirebaseApp.configure()
    }
    
    /// Set the correct ViewController depending on app state
    func setRootViewController(in window: UIWindow?, animated: Bool) {
        guard let keyWindow = window else { return }
        var oldVc = keyWindow.rootViewController
        keyWindow.rootViewController = checkAppStateInRepositoryAndReturnVC()
        let duration = animated == true ? 0.5 : 0.0
        UIView.transition(with: keyWindow, duration: duration, options: .transitionCrossDissolve, animations: {
        }, completion: { _ in
            if let oldRootVc = oldVc {
                oldRootVc.dismiss(animated: false, completion: {
                    oldVc = nil
                })
            }
        })
    }
    
    // TODO: THIS IS TEMPORARY, WE NEED A REPOSITORY TO SAVE THIS APP STATES
    private func checkAppStateInRepositoryAndReturnVC() -> UIViewController {
        let loggedIn = AppStateRepository.shared.isLoggedIn()
        let isOnboardingCompleted = AppStateRepository.shared.isOnboardingComplete()
        if loggedIn {
            if isOnboardingCompleted {
                return MainScreenVC.getVC()
            } else {
                return OnboardingVC.getVC()
            }
        } else {
            return LoginVC.getVC()
        }
    }
    
}
