//
//  FailedBannerView.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/4/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class FailedBannerView: UIView, XibViewGettable {
    
    @IBOutlet weak var verificationFailedLabel: UILabel!
    @IBOutlet weak var enterValidCodeLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        verificationFailedLabel.text = "banner.verificationFailed.title".local
        enterValidCodeLabel.text = "banner.enterValidCode.title".local
    }
}
