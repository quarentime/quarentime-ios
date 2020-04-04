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
    
    @IBOutlet var textFieldsCollection: [UITextField]!
    
    var textFieldsIndexes:[UITextField:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textFieldsCollection.last?.text?.isEmpty == false {
            let surveyVC = SurveyVC.getVC()
            present(surveyVC, animated: true, completion: nil)
        }
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
    
    //MARK: - IBActions
    
    @IBAction func privacyPolicyTapped(_ sender: Any) {
        if let url = URL(string: Constants.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
