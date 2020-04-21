//
//  StatusView.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/12/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

enum Status {
    case suspected
    case healthy
    case positive
    case recovered
}

class StatusView: UIView, XibViewGettable {
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel?
    @IBOutlet weak var highRiskLabel: UILabel?
    @IBOutlet weak var highRiskBackground: UIView!
        
    var initialStatus: Status = .positive
    
    override func awakeFromNib() {
        initialStatus = .positive
        setStatus()
        layer.cornerRadius = 6.0
    }
    
    func setStatus() {
        if initialStatus == .suspected {
            statusLabel?.text = "case.suspected".local
            backgroundColor = #colorLiteral(red: 0.9791664481, green: 0.7743744254, blue: 0.4536771178, alpha: 1)
        } else if initialStatus == .healthy {
            statusLabel?.text = "case.healthy".local
            backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.7568627451, blue: 0.968627451, alpha: 1)
        } else if initialStatus == .positive  {
            statusLabel?.text = "case.positive".local
            backgroundColor = #colorLiteral(red: 0.968627451, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
        } else if initialStatus == .recovered {
            statusLabel?.text = "case.recovered".local
            backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.5568627451, blue: 0.7411764706, alpha: 1)
        }
    }
}
