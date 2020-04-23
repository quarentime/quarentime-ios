//
//  VerifyPhoneNumberViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/31/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class VerifyAccountVC: UIViewController, UITextFieldDelegate, StoryboardGettable {
    
    enum Direction { case left, right }
    
    @IBOutlet weak var buttonStep1: UIButton!
    @IBOutlet weak var buttonStep2: UIButton!
    @IBOutlet weak var buttonStep3: UIButton!
    
    @IBOutlet weak var verifyAccountLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var didntGetCodeLabel: UILabel!
    @IBOutlet weak var resendCodeButton: UIButton!
    @IBOutlet weak var privacyLabel1: UILabel!
    @IBOutlet weak var privacyLabel2: UILabel!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet var textFieldsCollection: [UITextField]!
    
    @IBOutlet weak var bannerView: FailedBannerView!
    
    var textFieldsIndexes:[UITextField:Int] = [:]
    var codeString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardOnTap()
        setupLabel()
        resendCodeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        for index in 0 ..< textFieldsCollection.count {
            textFieldsIndexes[textFieldsCollection[index]] = index
        }
        
    }
    
    //MARK: - textField Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.length == 0 {
            textField.text = string
            setNextResponder(textFieldsIndexes[textField], direction: .right)
            return true
        } else if range.length == 1 {
            textField.text = ""
            setNextResponder(textFieldsIndexes[textField], direction: .left)
            return false
        }
        return false
    }
    
    // NOTE: following code looks horrible now and will be refactored once the phone verification feature is implemented. While testing use "000000" to pass to the next screen.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        codeString += textField.text!
        
        if textFieldsCollection.last?.text?.isEmpty == false && codeString != "000000"{
            failedVerificationBanner()
            codeString = ""
        } else if textFieldsCollection.last?.text?.isEmpty == false {
            let surveyVC = SurveyVC.getVC()
            present(surveyVC, animated: true, completion: nil)
        }
        print(codeString)
    }
    
    func setNextResponder(_ index:Int?, direction:Direction) {
        
        guard let index = index else { return }
        
        if direction == .left {
            index == 0 ?
                (_ = textFieldsCollection.first?.resignFirstResponder()) :
                (_ = textFieldsCollection[(index - 1)].becomeFirstResponder())
        } else {
            index == textFieldsCollection.count - 1 ?
                (_ = textFieldsCollection.last?.resignFirstResponder()) :
                (_ = textFieldsCollection[(index + 1)].becomeFirstResponder())
        }
        
    }
    
    //MARK: - Other
    
    func failedVerificationBanner() {
        let banner = FailedBannerView.getView()
        heightConstraint.constant = 100
        bannerView.addSubviewAndConstrainToEdges(banner, withMargin: 0)
        
        for item in textFieldsCollection {
            item.layer.borderWidth = 1
            item.layer.cornerRadius = 5
            item.layer.borderColor = #colorLiteral(red: 1, green: 0.3113751709, blue: 0.44245857, alpha: 1)
            item.text = ""
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
    
    func setupLabel() {
        verifyAccountLabel.text = "verifyAccount.title".local
        infoLabel.text = "verifyAccount.code.title".local
        didntGetCodeLabel.text = "verifyAccount.didntGetCode.title".local
        resendCodeButton.setTitle("verifyAccount.resendCode.title".local, for: .normal)
        privacyLabel1.text = "privacyPolicy.label1.title".local
        privacyLabel2.text = "privacyPolicy.label2.title".local
        privacyPolicyButton.setTitle("privacyPolicy.button.title".local, for: .normal)
    }
    
    //MARK: - IBActions
    @IBAction func privacyPolicyTapped(_ sender: Any) {
        if let url = URL(string: Constants.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
