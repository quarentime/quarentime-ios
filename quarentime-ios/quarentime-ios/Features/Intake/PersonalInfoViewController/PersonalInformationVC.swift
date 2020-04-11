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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
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
