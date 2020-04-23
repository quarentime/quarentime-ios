//
//  HelpNC.swift
//  quarentime-ios
//
//  Created by Angela Koceva on 4/22/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

class HelpNC: UINavigationController, StoryboardGettable {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [HelpVC.getVC()]
    }
}
 
