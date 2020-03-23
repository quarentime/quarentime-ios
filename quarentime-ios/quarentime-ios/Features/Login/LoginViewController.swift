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
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var facebookSignInButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set google sign-in delegate
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        googleSignInButton.setTitle("login.signin.google".local, for: .normal)
        facebookSignInButton.setTitle("login.signin.facebook".local, for: .normal)
        
        descriptionLabel.text = "login.description".local
        
    }
    
  
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func facebookSignIn(_ sender: Any) {
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
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
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                   if let error = error {
                       print("Login error: \(error.localizedDescription)")
                       let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                       let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       alertController.addAction(okayAction)
                       self.present(alertController, animated: true, completion: nil)
                       
                       return
                   }
                print(user?.user.displayName)
                print(user?.user.email)
                print(accessToken.tokenString)
                print(accessToken.expirationDate)
                print(accessToken.isExpired)
                print(accessToken.refreshDate)
                print(user?.user.refreshToken)
                
                   
                   // Present the main view
//                   if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
//                       UIApplication.shared.keyWindow?.rootViewController = viewController
//                       self.dismiss(animated: true, completion: nil)
//                   }
                   
               })
        
           }
        
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
            print(user?.user.displayName)
            print(user?.user.email)
            print(authentication.accessToken)
            print(authentication.refreshToken)
            print(user?.user.refreshToken)
            
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
