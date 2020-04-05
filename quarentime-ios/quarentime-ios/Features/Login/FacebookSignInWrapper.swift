//
//  GoogleSignInWrapper.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 5/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Firebase
import FBSDKLoginKit

final class FacebookSignInWrapper: NSObject {
    
    static let shared = FacebookSignInWrapper()
    
    private override init() { }
    
    private weak var presentingViewController: UIViewController?
    
    func signIn(with viewController: UIViewController) {
        presentingViewController = viewController
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { [weak self] (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self?.presentingViewController?.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                print(user?.user.displayName)
                print(user?.user.email)
                print(accessToken.tokenString)
                print(accessToken.expirationDate)
                print(accessToken.isExpired)
                print(accessToken.refreshDate)
                print(user?.user.refreshToken)
            })
        }
    }
    
}
