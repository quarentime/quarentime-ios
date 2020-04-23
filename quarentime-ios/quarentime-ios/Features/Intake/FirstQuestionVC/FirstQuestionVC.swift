//
//  FirstQuestionVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/3/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class FirstQuestionVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
        infoLabel.text = "survey.info.title".local
        questionLabel.text = "survey.question1.title".local
        yesButton.setTitle("yes.button".local, for: .normal)
        noButton.setTitle("no.button".local, for: .normal)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    //both buttons are connected with the next screen until the functionalities are done
    @IBAction func nextScreen(_ sender: Any) {
        let secondQuestionVC = SecondQuestionVC.getVC()
        navigationController?.pushViewController(secondQuestionVC, animated: true)
    }
}
