//
//  SurveyVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/3/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class SurveyVC: UIViewController, StoryboardGettable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func letsStartTapped(_ sender: Any) {
        let firstQuestionVC = FirstQuestionVC.getVC()
        present(firstQuestionVC, animated: true, completion: nil)
    }
    
}
