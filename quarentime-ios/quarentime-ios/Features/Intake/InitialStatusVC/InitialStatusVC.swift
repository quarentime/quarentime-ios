//
//  InitialStatusVC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/12/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class InitialStatusVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var statusView: StatusView!
    @IBOutlet weak var thanksLabel: UILabel!
    @IBOutlet weak var initialStatusLabel: UILabel!
    @IBOutlet weak var createTraceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTraceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        setStatusView()
    }
    
    //NOTE: Later we should set the status here
    func setStatusView() {
        let status = StatusView.getView()
        statusView.addSubviewAndConstrainToEdges(status, withMargin: 0)
    }
    
    func localization() {
        thanksLabel.text = "initialStatus.thanks.title".local;
        initialStatusLabel.text = "initialStatus.title".local
        createTraceButton.setTitle("initialStatus.createTrace.button".local, for: .normal)
    }
    
    @IBAction func createContactTraceAction(_ sender: Any) {
        let benefitsVC = BenefitsVC.getVC()
        present(benefitsVC, animated: true)
    }
    
}
