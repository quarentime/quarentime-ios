//
//  OnboardingVC.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 22/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class OnboardingVC: UIViewController, StoryboardGettable {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControlContainer: UIView!
    
    private lazy var pageControl: PageControlViewProtocol = {
        return PageControlView.getView(itemsCount: 4)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlContainer.addSubviewAndConstrainToEdges(pageControl)
        pageControl.currentIndex = 1
        
        skipButton.setTitle("button.skip".local, for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
    }
    
}
