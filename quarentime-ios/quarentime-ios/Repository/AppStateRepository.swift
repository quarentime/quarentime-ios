//
//  AppStateRepository.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 5/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation
import Firebase

private enum Keys: String {
    case isLoggedIn = "isLoggedIn"
    case isOnboardingComplete = "isOnboardingComplete"
    case isIntakeComplete = "isIntakeComplete"
}

struct AppStateRepository {

    static let shared = AppStateRepository()
    private let userDefaults = UserDefaults.standard

    private init() { }
    
    func setIsLoggedIn(to isLoggedIn: Bool) {
        userDefaults.set(isLoggedIn, forKey: Keys.isLoggedIn.rawValue)
        userDefaults.synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return userDefaults.object(forKey: Keys.isLoggedIn.rawValue) as? Bool ?? false
    }
    
    func getToken(onCompletion: @escaping (String) -> Void) {
        Auth.auth().currentUser?.getIDToken(completion: { (token, error) in
            guard let token = token else { return }
            onCompletion(token)
        })
    }
    
    func setIsOnboardingComplete(to isOnboardingComplete: Bool) {
        userDefaults.set(isOnboardingComplete, forKey: Keys.isOnboardingComplete.rawValue)
        userDefaults.synchronize()
    }
    
    func isOnboardingComplete() -> Bool {
        return userDefaults.object(forKey: Keys.isOnboardingComplete.rawValue) as? Bool ?? false
    }
    
    func isIntakeComplete() -> Bool {
        return userDefaults.object(forKey: Keys.isIntakeComplete.rawValue) as? Bool ?? false
    }
    
}
