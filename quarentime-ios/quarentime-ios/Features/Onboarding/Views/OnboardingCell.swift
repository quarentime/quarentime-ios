//
//  OnboaardingItem.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 27/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func configure(with item: OnboardingItem) {
        iconImageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
    }
    
}
