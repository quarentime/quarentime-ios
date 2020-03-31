//
//  VerifyPhoneNumberViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/31/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class VerifyPhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var buttonStep1: UIButton!
    @IBOutlet weak var buttonStep2: UIButton!
    @IBOutlet weak var buttonStep3: UIButton!
    
    @IBOutlet weak var infoTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        infoTextLabel.font = UIFont(name: "Roboto-Light", size: 8.0)
        
        setupStepButtons()
    }
    
    func setupStepButtons() {
        buttonStep1.layer.cornerRadius = buttonStep1.frame.width / 2
        
        buttonStep2.layer.borderWidth = 1
        buttonStep2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonStep2.layer.cornerRadius = buttonStep2.frame.width / 2

        buttonStep3.layer.borderWidth = 1
        buttonStep3.layer.borderColor = #colorLiteral(red: 0.8829681277, green: 0.8829888701, blue: 0.8829776645, alpha: 1)
        buttonStep3.layer.cornerRadius = buttonStep3.frame.width / 2
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
