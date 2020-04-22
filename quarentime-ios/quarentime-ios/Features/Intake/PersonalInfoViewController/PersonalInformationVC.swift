//
//  PersonalInfoViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/28/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import Firebase

class PersonalInformationVC: UIViewController, UITextFieldDelegate, StoryboardGettable, HudViewLoadable  {

    @IBOutlet weak var buttonStep1: UIButton!
    @IBOutlet weak var buttonStep2: UIButton!
    @IBOutlet weak var buttonStep3: UIButton!
    
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var telephoneNumberLabel: UILabel!
    @IBOutlet weak var privacyLabel1: UILabel!
    @IBOutlet weak var privacyLabel2: UILabel!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var letsStartButton: CustomButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        localization()
        dismissKeyboard()
    }
    
    private func postUserInfo(info: PersonalInformation, onCompletion: @escaping (Result<Void, Error>) -> Void) {
        SetPersonalInformation(with: info).execute { result in
            switch result {
            case .success(_):
                onCompletion(.success(()))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
    private func showVerifyAccount() {
        let verifyAccountVC = VerifyAccountVC.getVC()
        present(verifyAccountVC, animated: true, completion: nil)
    }
    
    @IBAction func privacyPolicyTapped(_ sender: Any) {
        if let url = URL(string: Constants.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func letsStartTapped(_ sender: Any) {
        guard let email = Auth.auth().currentUser?.email,
            let name = nameTextField.text,
            let surname = surnameTextField.text,
            let phone = phoneNumberTextField.getFormattedPhoneNumber(format: .E164),
            let ageString = ageTextField.text,
            let age = Int(ageString)
        else { return }
        let info = PersonalInformation(email: email, name: name, surname: surname, phone_number: phone, age: age) //"+64225056778"
        showBlurActivityIndicator()
        postUserInfo(info: info) { [weak self] result in
            switch result {
            case .success(_):
                self?.showVerifyAccount()
            case .failure(let error):
                self?.hideActivityIndicator()
                print(error)
                //TODO: SHOW ERROR MESSAGE
            }
        }
    }
    
    //MARK: - Keyboard
    func dismissKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Other
    func localization() {
        personalInfoLabel.text = "personalInfo.title".local
        nameLabel.text = "personalInfo.name.title".local
        surnameLabel.text = "personalInfo.surname.title".local
        ageLabel.text = "personalInfo.age.title".local
        telephoneNumberLabel.text = "personalInfo.telephoneNumber.title".local
        
        nameTextField.placeholder = "personalInfo.name.placeholder".local
        surnameTextField.placeholder = "personalInfo.surname.placeholder".local
        ageTextField.placeholder = "personalInfo.age.placeholder".local
        
        privacyLabel1.text = "privacyPolicy.label1.title".local
        privacyLabel2.text = "privacyPolicy.label2.title".local
        privacyPolicyButton.setTitle("privacyPolicy.button.title".local, for: .normal)
        letsStartButton.setTitle("letsStart.button".local, for: .normal)
    }
}

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
