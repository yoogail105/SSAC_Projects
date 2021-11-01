//
//  AddViewController.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//


import UIKit

class AddViewController: UIViewController, UITextViewDelegate {

    static let identifier = "AddViewController"
    
    
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var diaryImageView: UIImageView!
    @IBOutlet weak var diaryTitleTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var diaryTextView: UITextView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.endEditing(true)
        // naviConfigure()
        // 왜 위의 함수를 이용하면 안뜨는 거죠..?
    }
    
    @IBAction func closeButtonClicked(_ sender: UIBarButtonItem) {
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
    
    func naviConfigure() {
        navigationItem.title = "일기 쓰기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked2))
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked2))
    }
     
    
    @objc func closeButtonClicked2() {
        
    }
    @objc func saveButtonClicked2() {
        
    }
    
    
    
}

