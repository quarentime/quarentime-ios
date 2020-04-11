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
            
            Auth.auth().signIn(with: credential, completion: { [weak self] (authResult, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self?.presentingViewController?.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                authResult?.user.getIDToken(completion: { (token, error) in
                    if error == nil {
                        AppStateRepository.shared.setIsLoggedIn(to: true)
                    } else {
                        print(error ?? "")
                    }
                })
            })
        }
    }
    
}
