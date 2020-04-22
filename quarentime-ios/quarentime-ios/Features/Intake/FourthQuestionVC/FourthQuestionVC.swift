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
        questionLabel.text = "survey.question2b.title".local
        yesButton.setTitle("yes.button".local, for: .normal)
        noButton.setTitle("no.button".local, for: .normal)
        definitionLabel.text = "survey.question2b.definition.title".local
        firstParagraphLabel.text = "survey.question2b.paragraph1.title".local
        secondParagraphLabel.text = "survey.question2b.paragraph2.title".local
        thirdParagraphLabel.text = "survey.question2b.paragraph3.title".local
        fourthParagraphLabel.text = "survey.question2b.paragraph4.title".local
        fifthParagraphLabel.text = "survey.question2b.paragraph5.title".local
        sourceLabel.text = "survey.question2b.source.title".local
    }
    
}
