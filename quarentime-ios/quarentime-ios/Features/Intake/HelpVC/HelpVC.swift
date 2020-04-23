//
//  HelpVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/22/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class HelpVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var paragraph1Label: UILabel!
    @IBOutlet weak var paragraph2Label: UILabel!
    @IBOutlet weak var paragraph3Label: UILabel!
    @IBOutlet weak var paragraph4Label: UILabel!
    
    //NOTE: Used for testing, will be rearanged soon
    var initialStatus: Status = .recovered
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 6
        setParagraphs()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setParagraphs() {
        switch initialStatus {
        case .suspected:
            coloredView.backgroundColor = #colorLiteral(red: 0.9791664481, green: 0.7743744254, blue: 0.4536771178, alpha: 1)
            colorLabel.text = "help.color.yellow.title".local
            statusLabel.text = "help.yellow.title".local
            paragraph1Label.text = "help.yellow.paragraph1.title".local
            paragraph2Label.text = "help.yellow.paragraph2.title".local
            paragraph3Label.text = "help.yellow.paragraph3.title".local
            paragraph4Label.text = "".local
        case .healthy:
            coloredView.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.7568627451, blue: 0.968627451, alpha: 1)
            colorLabel.text = "help.color.blue.title".local
            statusLabel.text = "help.blue.title".local
            paragraph1Label.text = "help.blue.paragraph1.title".local
            paragraph2Label.text = "help.blue.boldParagraph.title".local
            paragraph2Label.font = UIFont.boldSystemFont(ofSize: 14.0)
            paragraph3Label.text = "help.blue.paragraph3.title".local
            paragraph4Label.text = "".local
        case .positive:
            coloredView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
            colorLabel.text = "help.color.red.title".local
            statusLabel.text = "help.red.title".local
            paragraph1Label.text = "help.red.paragraph1.title".local
            paragraph2Label.text = "help.red.paragraph2.title".local
            paragraph3Label.text = "help.red.paragraph3.title".local
            paragraph4Label.text = "help.red.boldParagraph.title".local
            paragraph4Label.font = UIFont.boldSystemFont(ofSize: 14.0)
        case .recovered:
            coloredView.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.5568627451, blue: 0.7411764706, alpha: 1)
            colorLabel.text = "help.color.purple.title".local
            statusLabel.text = "help.purple.title".local
            paragraph1Label.text = "help.purple.boldParagraph.title".local
            paragraph1Label.font = UIFont.boldSystemFont(ofSize: 14.0)
            paragraph2Label.text = "help.purple.paragraph2.title".local
            paragraph3Label.text = "".local
            paragraph4Label.text = "".local
        }
    }
}
