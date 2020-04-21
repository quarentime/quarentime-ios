//
//  BenefitsVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/13/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class BenefitsVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var paragraph1: UILabel!
    @IBOutlet weak var paragraph2: UILabel!
    @IBOutlet weak var helpingWorkersLabel: UILabel!
    @IBOutlet weak var paragraph3: UILabel!
    @IBOutlet weak var inContactTracingLabel: UILabel!
    @IBOutlet weak var paragraph4: UILabel!
    @IBOutlet weak var paragraph5: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        localization()
    }
    
    func localization() {
        questionLabel.text = "benefits.question.text".local
        benefitsLabel.text = "benefits.text".local
        paragraph1.text = "benefits.paragraph1.text".local
        paragraph2.text = "benefits.paragraph2.text".local
        helpingWorkersLabel.text = "benefits.boldParagraph3.text".local
        paragraph3.text = "benefits.paragraph3.text".local
        inContactTracingLabel.text = "benefits.boldParagraph4.text".local
        paragraph4.text = "benefits.paragraph4.text".local
        paragraph5.text = "benefits.paragraph5.text".local
    }
}
