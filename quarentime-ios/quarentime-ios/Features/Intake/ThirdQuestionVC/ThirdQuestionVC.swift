//
//  ThirdQuestionVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/11/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class ThirdQuestionVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var yesButton: CustomButton!
    @IBOutlet weak var noButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func localization() {
        question.text = "question2a.text".local
        noButton.setTitle("no.button".local, for: .normal)
        yesButton.setTitle("yes.button".local, for: .normal)
    }
    
    //temporary action
    @IBAction func nextScreen(_ sender: Any) {
        let fourthQuestionVC = FourthQuestionVC.getVC()
        navigationController?.pushViewController(fourthQuestionVC, animated: true)
    }
    
}
