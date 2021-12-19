//
//  StackView.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/19.
//

import UIKit

class StackView: UIStackView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.axis = .horizontal
        self.spacing = 5
        self.alignment = .fill
        self.distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
