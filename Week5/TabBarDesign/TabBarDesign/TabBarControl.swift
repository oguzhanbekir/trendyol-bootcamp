//
//  TabBarControl.swift
//  TabBarDesign
//
//  Created by Oguzhan Bekir on 10.05.2021.
//

import UIKit

class TabBarControl: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        middleButtonImage()
   }
    
    func middleButtonImage() {
        let middleImgBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-30, y: -25, width: 60, height: 60))
        middleImgBtn.setImage(UIImage(named: "feed"), for: .normal)
 
        self.tabBar.addSubview(middleImgBtn)
        middleImgBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
}
