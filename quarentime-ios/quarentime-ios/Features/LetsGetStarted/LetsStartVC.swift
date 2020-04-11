//
//  OnboardingVC.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 22/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class LetsStartVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var letsStartButton: UIButton!
    @IBOutlet weak var thanksLabel: UILabel!
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var smallImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mediumImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var largeImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var smallImageCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var mediumImageCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var largeImageCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thanksLabel.text = "letsStart.title".local
        letsStartButton.setTitle("letsStart.button".local, for: .normal)
        letsStartButton.layer.cornerRadius = 4
        moveImagesOut()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveImagesIn()
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .allowUserInteraction, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
    
    @IBAction func letsStartTapped(_ sender: UIButton) {
        moveImagesOut()
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .allowUserInteraction, animations: { [weak self] in
            self?.thanksLabel.alpha = 0
            self?.smallImageView.alpha = 0
            self?.mediumImageView.alpha = 0
            self?.letsStartButton.alpha = 0
            self?.view.layoutIfNeeded()
        }) { done in
            AppStateRepository.shared.setIsOnboardingComplete(to: true)
            LaunchCoordinator.shared.reValidateEntryPoint()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func moveImagesOut() {
        smallImageTopConstraint.constant = 300
        smallImageCenterConstraint.constant = 300
        mediumImageTopConstraint.constant = 300
        mediumImageCenterConstraint.constant = -300
        largeImageTopConstraint.constant = -300
        largeImageCenterConstraint.constant = 300
    }
    
    private func moveImagesIn() {
        smallImageTopConstraint.constant = 117
        smallImageCenterConstraint.constant = 70
        mediumImageTopConstraint.constant = 15
        mediumImageCenterConstraint.constant = -70
        largeImageTopConstraint.constant = 25
        largeImageCenterConstraint.constant = 40
    }
    
}
