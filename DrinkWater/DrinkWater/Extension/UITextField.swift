//
//  UITextField.swift
//  DrinkWater
//
//  Created by minjoohehe on 2021/10/11.
//

import UIKit

// 키패드 위에 완료 버튼 넣기
extension UITextField {
    @IBInspectable var doneAccesory: Bool{
        get {
            return self.doneAccesory
        }
        set(hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            self.inputAccessoryView = doneToolbar
        }
    
    //완료 누르면 키패드 사라지게
    @objc func doneButtonAction() {
            self.endEditing(true)
        }
    
   
}
