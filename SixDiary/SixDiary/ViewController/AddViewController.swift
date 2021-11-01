//
//  AddViewController.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//


import UIKit

class AddViewController: UIViewController, UITextViewDelegate {

    static let identifier = "AddViewController"
    
    
    @IBOutlet weak var diaryImageView: UIImageView!
    @IBOutlet weak var diaryTitleTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var diaryTextView: UITextView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviConfigure()
        setUI()
        
        view.endEditing(true)
    }
   // welcomeLabel.font = UIFont().mainBlack
    func naviConfigure() {
        navigationItem.title = "일기 쓰기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUI() {
        diaryTitleTextField.cornerRounded(cornerRadius: 10)
        dateButton.cornerRounded(cornerRadius: 10)
        diaryTitleTextField.cornerRounded(cornerRadius: 10)
        
        
        
        
        diaryImageView.image = UIImage(named: "diaryBackground")
        diaryImageView.contentMode = .scaleAspectFill
        diaryTextView.backgroundColor = UIColor(named: "skyblue")
        diaryTitleTextField.backgroundColor = UIColor(named: "skyblue")
        dateButton.backgroundColor = UIColor(named: "skyblue")
        diaryTitleTextField.placeholder = "제목을 입력해 주세요"
        diaryTitleTextField.textAlignment = .center
        
        
    }
    
    
    @objc func saveButtonClicked() {
        
    }
    
    
    
}

