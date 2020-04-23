//
//  SecondQuestionVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/3/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class SecondQuestionVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
        questionLabel.text = "survey.question2.title".local
        infoLabel.text = "survey.selectSymptoms.title".local
        nextButton.setTitle("next.button".local, for: .normal)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    //temporary button
    @IBAction func nextScreenAction(_ sender: Any) {
        let thirdQuestionVC = ThirdQuestionVC.getVC()
        navigationController?.pushViewController(thirdQuestionVC, animated: true)
    }
    
}
