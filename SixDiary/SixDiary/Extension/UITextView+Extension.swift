//
//  UITextView+Extension.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import UIKit

extension UITextView {
//AddViewController:  UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.text == "" {
            textViewSetupView()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
    }
        return true
    }
    
    func textViewSetupView() {
        if self.text == "일기를 작성해 주세요." {
            self.text = ""
            self.textColor = UIColor.black
        } else if self.text == "" {
            self.text = "일기를 작성해 주세요."
            self.textColor = UIColor.lightGray
        }
    }
}


