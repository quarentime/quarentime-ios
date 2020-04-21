//
//  FourthQuestionVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/11/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class FourthQuestionVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButton: CustomButton!
    @IBOutlet weak var noButton: CustomButton!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var firstParagraphLabel: UILabel!
    @IBOutlet weak var secondParagraphLabel: UILabel!
    @IBOutlet weak var thirdParagraphLabel: UILabel!
    @IBOutlet weak var fourthParagraphLabel: UILabel!
    @IBOutlet weak var fifthParagraphLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localization()
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        borderView.layer.cornerRadius = 4.0
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let nextVC = ConfirmationVC.getVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func localization() {
        questionLabel.text = "question2b.text".local
        yesButton.setTitle("yes.button".local, for: .normal)
        noButton.setTitle("no.button".local, for: .normal)
        definitionLabel.text = "definition.text".local
        firstParagraphLabel.text = "paragraph1.text".local
        secondParagraphLabel.text = "paragraph2.text".local
        thirdParagraphLabel.text = "paragraph3.text".local
        fourthParagraphLabel.text = "paragraph4.text".local
        fifthParagraphLabel.text = "paragraph5.text" .local
        sourceLabel.text = "sourceWHO.text".local
    }
    
}
