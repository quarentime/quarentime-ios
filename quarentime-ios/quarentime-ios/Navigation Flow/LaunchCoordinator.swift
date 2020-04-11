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
    
    /// After changes in AppStateRepository this method will know which ViewController set as Root
    func reValidateEntryPoint(animated: Bool = true) {
        setRootViewController(in: UIApplication.shared.windows.first, animated: animated)
    }
    
    private func checkAppStateInRepositoryAndReturnVC() -> UIViewController {
        let loggedIn = AppStateRepository.shared.isLoggedIn()
        if loggedIn {
            let isOnboardingCompleted = AppStateRepository.shared.isOnboardingComplete()
            if isOnboardingCompleted {
                let isIntakeComplete = AppStateRepository.shared.isIntakeComplete()
                if isIntakeComplete {
                    return MainScreenVC.getVC()
                } else {
                    return PersonalInformationVC.getVC()
                }
            } else {
                return OnboardingVC.getVC()
            }
        } else {
            return LoginVC.getVC()
        }
    }
    
}
