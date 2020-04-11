//
//  GoogleSignInWrapper.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 5/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Firebase
import GoogleSignIn

final class GoogleSignInWrapper: NSObject, GIDSignInDelegate {
    
    static let shared = GoogleSignInWrapper()
    
    private override init() { }
    
    private weak var presentingViewController: UIViewController?
    
    func signIn(with viewController: UIViewController) {
        presentingViewController = viewController
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
        GIDSignIn.sharedInstance().signIn()
    }
    
    func handle(_ url: URL) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
        
        Auth.auth().signIn(with: credential, completion: { (authResult, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            authResult?.user.getIDToken(completion: { (token, error) in
                if error == nil {
                    AppStateRepository.shared.setIsLoggedIn(to: true)
                    LaunchCoordinator.shared.reValidateEntryPoint()
                } else {
                    print(error ?? "")
                }
            })
        })
    }
    
    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        // Showing OAuth2 authentication window
        if let aController = viewController {
            presentingViewController?.present(aController, animated: true) {() -> Void in }
        }
    }
    
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        presentingViewController?.dismiss(animated: true) {() -> Void in }
    }
    
}
