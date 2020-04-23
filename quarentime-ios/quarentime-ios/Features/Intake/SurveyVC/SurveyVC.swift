//
//  SurveyVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/3/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class SurveyVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var quarentimeIntakeLabel: UILabel!
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var letsStartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
        quarentimeIntakeLabel.text = "survey.quarentimeIntake.title".local
        infoLabel1.text = "survey.intakeInfo1.title".local
        infoLabel2.text = "survey.intakeInfo2.title".local
        letsStartButton.setTitle("next.button".local, for: .normal)
    }
    
    @IBAction func letsStartTapped(_ sender: Any) {
        let surveyNC = SurveyNC.getNavigationVC()
        present(surveyNC, animated: true, completion: nil)
    }
}
