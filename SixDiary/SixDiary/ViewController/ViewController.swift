//
//  ViewController.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var backupRestoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        // 폰트 사용하기
        
        // 가장 작게는 11, 네비게이션 등 크게는 17,20
        
        // comment = 주석처리
    //    welcomeLabel.text = "welcome_text".localized
        welcomeLabel.text = LocalizableStrings.welcome_text.localized
        welcomeLabel.font = UIFont().mainBlack
        
//        backupRestoreLabel.text = NSLocalizedString("data_backup", tableName:"Setting", bundle: .main, value: "", comment: "")
        
        backupRestoreLabel.text = LocalizableStrings.data_backup.localizedSetting
    }
    
    
}

