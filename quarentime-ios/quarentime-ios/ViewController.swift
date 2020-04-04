//
//  ViewController.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    
    //temporary button
    @IBAction func goToIntake(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "PersonalInformationVC", bundle: nil)
        let personalInfo = storyBoard.instantiateViewController(withIdentifier: "personalInfo") as! PersonalInformationVC
        self.present(personalInfo, animated: true, completion: nil)
    }
    
}

