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
        localization()
    }
    
    func localization() {
        quarentimeIntakeLabel.text = "quarentimeIntake.text".local
        infoLabel1.text = "intakeInfo1.text".local
        infoLabel2.text = "intakeInfo2.text".local
        letsStartButton.setTitle("next.button".local, for: .normal)
    }
    
    @IBAction func letsStartTapped(_ sender: Any) {
        let surveyNC = SurveyNC.getNavigationVC()
        present(surveyNC, animated: true, completion: nil)
    }
}
