//
//  LoginViewController.swift
//  quarentime-ios
//
//  Created by Sergio Gregori on 22/03/2020.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    // @IBOutlet weak var googleSignInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set google sign-in delegate
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
//
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
        
        
        GIDSignIn.sharedInstance().delegate = self
        // GIDSignIn.sharedInstance().uiDelegate = self
            
        
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
     func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        if let error = error {
          print(error.localizedDescription)
          return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
    // When user is signed in
        Auth.auth().signIn(with: credential, completion: { (user, error) in
          if let error = error {
            print("Login error: \(error.localizedDescription)")
            return
          }
            // aca en user tengo toda la data del usuario para mandar al server
        })
      }
      // Start Google OAuth2 Authentication
      func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
      
        // Showing OAuth2 authentication window
        if let aController = viewController {
          present(aController, animated: true) {() -> Void in }
        }
      }
      // After Google OAuth2 authentication
      func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
