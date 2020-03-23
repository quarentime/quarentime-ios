//
//  StoryboardGettable.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import UIKit

protocol StoryboardGettable where Self: UIViewController {}

extension StoryboardGettable {
    
    private static func getVCFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: T.self))
        if let vc = storyboard.instantiateInitialViewController() as? T {
            return vc
        } else {
            fatalError("Cannot find view controller: \(name)")
        }
    }
    
    private static func getNCFromStoryboard() -> UINavigationController {
        let name = String(describing: Self.self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: Self.self))
        if let nc = storyboard.instantiateInitialViewController() as? UINavigationController {
            return nc
        } else {
            fatalError("Cannot find navigationController")
        }
    }
    
    static func getVC() -> Self {
        return getVCFromStoryboard()
    }
    
    static func getNavigationVC() -> UINavigationController {
        return getNCFromStoryboard()
    }
    
}
