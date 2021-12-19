//
//  WhiteButton.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/18.
//


import UIKit

class WhiteButton: UIButton {
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.tintColor = .white
        //self.layer.borderWidth = 1
        //self.layer.borderColor = UIColor.white.cgColor
        //self.layer.cornerRadius = self.bounds.width / 2
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
