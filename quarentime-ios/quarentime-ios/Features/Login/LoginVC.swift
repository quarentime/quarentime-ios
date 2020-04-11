//
//  LoginViewController.swift
//  quarentime-ios
//
//  Created by Sergio Gregori on 22/03/2020.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, StoryboardGettable, HudViewLoadable {
    
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var facebookSignInButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        googleSignInButton.setTitle("login.signin.google".local, for: .normal)
        facebookSignInButton.setTitle("login.signin.facebook".local, for: .normal)
        descriptionLabel.text = "login.description".local
    }
    
    @IBAction func googleSignIn(_ sender: Any) {
        showBlurActivityIndicator()
        GoogleSignInWrapper.shared.signIn(with: self)
    }
    
    @IBAction func facebookSignIn(_ sender: Any) {
        showBlurActivityIndicator()
        FacebookSignInWrapper.shared.signIn(with: self)
    }
    
}
