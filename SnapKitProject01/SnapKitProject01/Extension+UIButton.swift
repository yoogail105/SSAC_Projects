//
//  ProfileBottonButton.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/19.
//

import Foundation
import UIKit


extension UIButton {
    
    func ProfileBottonButton(title: String, image: String) -> UIButton {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12)
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.image = UIImage(systemName: image)
        configuration.imagePadding = 10.0
        configuration.imagePlacement = .top
        let button = WhiteButton(configuration: configuration, primaryAction: nil)
        
        return button
    }
}
