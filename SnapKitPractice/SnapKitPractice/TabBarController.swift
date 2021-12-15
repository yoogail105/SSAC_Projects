//
//  TabBarController.swift
//  SnapKitPractice
//
//  Created by 성민주민주 on 2021/12/15.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homeVC = HomeViewController()
        tabBarSetting(targetVC: homeVC, name: "홈", image: "house", selectedImage: "house.fill")
        
        let secondVC = SecondViewController()
        tabBarSetting(targetVC: secondVC, name: "동네생활", image: "building.2", selectedImage: "building.2.fill")
//        secondVC.tabBarItem.title = "동네생활"
//        homeVC.tabBarItem.image = UIImage(systemName: "building.2")
//        homeVC.tabBarItem.selectedImage = UIImage(systemName: "building.2.fill")
        
        let nearbyVC = NearByViewController()
        tabBarSetting(targetVC: nearbyVC, name: "내 근처", image: "mappin.circle", selectedImage: "mappin.circle.fill")
       
        
        let chatVC = ChatViewController()
        tabBarSetting(targetVC: chatVC, name: "채팅", image: "bubble.left.and.bubble.right", selectedImage: "bubble.left.and.bubble.right.fill")
        
        
        let profileVC = ProfileViewController()
        tabBarSetting(targetVC: profileVC, name: "나의 당근", image: "person", selectedImage: "person.fill")
        
        //viewControllers = [homeVC, secondVC, nearbyVC, chatVC, profileVC]
        setViewControllers([homeVC, secondVC, nearbyVC, chatVC, profileVC], animated: true)
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .lightGray
        tabBar.unselectedItemTintColor = .darkGray
    }
    
    func tabBarSetting(targetVC: UIViewController, name: String, image: String, selectedImage: String) {
        targetVC.tabBarItem.title = name
        targetVC.tabBarItem.image = UIImage(systemName: image)
        targetVC.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
    }
    
    
}
