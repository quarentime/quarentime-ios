//
//  ConfirmationVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/12/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class ConfirmationVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var firstCheckbox: UIButton!
    @IBOutlet weak var secondCheckbox: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMultipleTapLabel()
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        setupLabels()
    }
    
    private func setupLabels() {
        firstLabel.text = "confirmation.label1.title".local
        secondLabel.text = "confirmation.label2.title".local
        nextButton.setTitle("next.button".local, for: .normal)
    }
    
    //MARK: - Tappable Label
    func setupMultipleTapLabel() {
        let text = (secondLabel.text)!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let termsRange = (text as NSString).range(of: "Terms and Conditions")
        let privacyRange = (text as NSString).range(of: "Privacy Policy")
        underlineAttriString.addAttributes([.foregroundColor: UIColor.black,
                                            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)],
                                           range: termsRange)
        underlineAttriString.addAttributes([.foregroundColor: UIColor.black,
                                            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)],
                                           range: privacyRange)
        secondLabel.attributedText = underlineAttriString
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(gesture:)))
        secondLabel.addGestureRecognizer(tapAction)
    }
    
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: secondLabel, targetText: "Terms and Conditions") {
            if let url = URL(string: Constants.urlTermsAndConditions) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if gesture.didTapAttributedTextInLabel(label: secondLabel, targetText: "Privacy Policy") {
            if let url = URL(string: Constants.urlPrivacyPolicy) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            print("Tapped none")
        }
    }
    
    func enableNextButtonIfNeeded() {
        if firstCheckbox.isSelected == true && secondCheckbox.isSelected == true {
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
        } else {
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }
    }
    
    @IBAction func firstCheckboxActon(_ sender: Any) {
        if firstCheckbox.isSelected == false {
            firstCheckbox.isSelected = true
            firstCheckbox.backgroundColor = UIColor.black
        } else {
            firstCheckbox.isSelected = false
            firstCheckbox.backgroundColor = UIColor.white
        }
        enableNextButtonIfNeeded()
    }
    
    @IBAction func secondCheckboxAction(_ sender: Any) {
        if secondCheckbox.isSelected == false {
            secondCheckbox.isSelected = true
            secondCheckbox.backgroundColor = UIColor.black
        } else {
            secondCheckbox.isSelected = false
            secondCheckbox.backgroundColor = UIColor.white
        }
        enableNextButtonIfNeeded()
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let nextVC = InitialStatusVC.getVC()
        present(nextVC, animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, targetText: String) -> Bool {
        guard let attributedString = label.attributedText, let lblText = label.text else { return false }
        let targetRange = (lblText as NSString).range(of: targetText)
        let mutableAttribString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttribString.addAttributes(
            [NSAttributedString.Key.font: label.font ?? UIFont.smallSystemFontSize],
            range: NSRange(location: 0, length: attributedString.length)
        )
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: mutableAttribString)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y:
            locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}

