//
//  MainScreenVC.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 4/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

final class MainScreenVC: UITabBarController, StoryboardGettable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [HomeVC.getVC(), TrackVC.getVC(), AddFriendsVC.getVC(), SymptomsVC.getVC()]
    }
    
}
