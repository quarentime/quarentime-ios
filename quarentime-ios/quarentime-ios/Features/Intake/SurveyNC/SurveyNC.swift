//
//  SurveyNC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/16/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class SurveyNC: UINavigationController, StoryboardGettable {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [FirstQuestionVC.getVC()]
    }
}
