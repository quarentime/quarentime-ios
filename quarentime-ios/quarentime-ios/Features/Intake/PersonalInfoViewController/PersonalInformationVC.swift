//
//  PersonalInfoViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/28/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class PersonalInformationVC: UIViewController, UITextFieldDelegate, StoryboardGettable  {

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
    
//MARK: - Actions
    @IBAction func privacyPolicyTapped(_ sender: Any) {
        if let url = URL(string: Constants.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func letsStartTapped(_ sender: Any) {
        let verifyAcc = VerifyAccountVC.getVC()
        present(verifyAcc, animated: true, completion: nil)
    }
    
}

//MARK: - Extentions

extension PersonalInformationVC: FPNTextFieldDelegate {

    
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
