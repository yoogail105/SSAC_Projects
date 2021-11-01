//
//  UIView+Extension.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//
/*
 import UIKit.UIFont
 extension UIFont {
     var mainBlack: UIFont {
         // 이 파일이 있는 것이 100% 확실하니까 ! 사용 ok
         return UIFont(name: "S-CoreDream-8Heavy", size: 14)!
     }
 }
 */
import UIKit

extension UIView {
 
    func cornerRounded(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
