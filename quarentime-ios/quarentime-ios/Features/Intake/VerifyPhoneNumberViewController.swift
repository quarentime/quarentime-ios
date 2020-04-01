//
//  VerifyPhoneNumberViewController.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 3/31/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class VerifyPhoneNumberViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var buttonStep1: UIButton!
    @IBOutlet weak var buttonStep2: UIButton!
    @IBOutlet weak var buttonStep3: UIButton!
    
    @IBOutlet var codeOutletCollection: [UITextField]!
    @IBOutlet weak var infoTextLabel: UILabel!
    
    var textFieldsIndexes:[UITextField:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0 ..< codeOutletCollection.count {
            textFieldsIndexes[codeOutletCollection[index]] = index
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        infoTextLabel.font = UIFont(name: "Roboto-Light", size: 8.0)
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
    
    enum Direction { case left, right }
    
    func setNextResponder(_ index:Int?, direction:Direction) {
        
        guard let index = index else { return }
        
        if direction == .left {
            index == 0 ?
                (_ = codeOutletCollection.first?.resignFirstResponder()) :
                (_ = codeOutletCollection[(index - 1)].becomeFirstResponder())
        } else {
            index == codeOutletCollection.count - 1 ?
                (_ = codeOutletCollection.last?.resignFirstResponder()) :
                (_ = codeOutletCollection[(index + 1)].becomeFirstResponder())
        }
        
    }
    
    //MARK: - IBActions
    
    @IBAction func privacyPolicyClicked(_ sender: Any) {
        if let url = URL(string: K.urlPrivacyPolicy) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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
