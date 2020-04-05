//
//  AppStateRepository.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 5/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation

private enum Keys: String {
    case isLoggedIn = "isLoggedIn"
    case isOnboardingComplete = "isOnboardingComplete"
    case logInToken = "logInToken"
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
    
    func set(token: String) {
        userDefaults.set(token, forKey: Keys.logInToken.rawValue)
        userDefaults.synchronize()
    }
    
    func get(token: String) -> String {
        return userDefaults.object(forKey: Keys.logInToken.rawValue) as? String ?? ""
    }
    
    func setIsOnboardingComplete(to isOnboardingComplete: Bool) {
        userDefaults.set(isOnboardingComplete, forKey: Keys.isOnboardingComplete.rawValue)
        userDefaults.synchronize()
    }
    
    func isOnboardingComplete() -> Bool {
        return userDefaults.object(forKey: Keys.isOnboardingComplete.rawValue) as? Bool ?? false
    }
    
}
