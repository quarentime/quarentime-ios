//
//  PersonalInfoViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/28/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class PersonalInfoViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet var buttonStep1: UIButton!
    @IBOutlet var buttonStep2: UIButton!
    @IBOutlet var buttonStep3: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupStepButtons()
    }
    
    func setupStepButtons() {
        buttonStep1.layer.borderWidth = 1
        buttonStep1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonStep1.layer.cornerRadius = buttonStep1.frame.width / 2
        
        buttonStep2.layer.borderWidth = 1
        buttonStep2.layer.borderColor = #colorLiteral(red: 0.8829681277, green: 0.8829888701, blue: 0.8829776645, alpha: 1)
        buttonStep2.layer.cornerRadius = buttonStep2.frame.width / 2

        buttonStep3.layer.borderWidth = 1
        buttonStep3.layer.borderColor = #colorLiteral(red: 0.8829681277, green: 0.8829888701, blue: 0.8829776645, alpha: 1)
        buttonStep3.layer.cornerRadius = buttonStep3.frame.width / 2
    }
    
//MARK: - Actions
    @IBAction func privacyPolicyClicked(_ sender: Any) {
        if let url = URL(string: K.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

//MARK: - Extentions

extension PersonalInfoViewController: FPNTextFieldDelegate {

    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
    }
    
    func fpnDisplayCountryList() {
        
        let listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)

        phoneNumberTextField.displayMode = .list
        listController.setup(repository: phoneNumberTextField.countryRepository)
        listController.didSelect = { [weak self] country in
        self?.phoneNumberTextField.setFlag(countryCode: country.code) }
        
        let navigationViewController = UINavigationController(rootViewController: listController)
        listController.title = "Countries"
        present(navigationViewController, animated: true, completion: nil)
    }
}
