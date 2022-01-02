//
//  SignViewController.swift
//  SSACCommu
//
//  Created by 성민주민주 on 2022/01/03.
//

import UIKit

class SignViewController: BaseViewController {
    
    var mainView = SignView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.emailTextField.placeholder = "이메일을 작성해 주세요"
    }
}
