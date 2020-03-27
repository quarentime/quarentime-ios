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
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var pageControl: PageControlViewProtocol = {
        return PageControlView.getView(itemsCount: 4)
    }()
    
    private lazy var items: [OnboardingItem] = {
        return [
            OnboardingItem(image: "addfriends", title: "onboarding.page1.title".local, subTitle: "onboarding.page1.subTitle".local),
            OnboardingItem(image: "track", title: "onboarding.page2.title".local, subTitle: "onboarding.page2.subTitle".local),
            OnboardingItem(image: "symptoms", title: "onboarding.page3.title".local, subTitle: "onboarding.page3.subTitle".local),
            OnboardingItem(image: "notifications", title: "onboarding.page4.title".local, subTitle: "onboarding.page4.subTitle".local)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlContainer.addSubviewAndConstrainToEdges(pageControl)
        pageControl.currentIndex = 0
        
        collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "onboardingCell")
        
        skipButton.setTitle("button.skip".local, for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func skipTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension OnboardingVC: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex: CGFloat = collectionView.contentOffset.x / collectionView.frame.size.width
        pageControl.currentIndex = Int(currentIndex)
    }
    
}

extension OnboardingVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as! OnboardingCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
}
