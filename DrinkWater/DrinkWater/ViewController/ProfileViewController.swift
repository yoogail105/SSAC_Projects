//
//  ProfileViewController.swift
//  DrinkWater
//
//  Created by minjoohehe on 2021/10/09.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {
    
    // MARK: - PROPERTIES
   
    //@IBOutlet var SessacImage: UIImageView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameText: HoshiTextField!
    @IBOutlet var heightText: HoshiTextField!
    @IBOutlet var weightText: HoshiTextField!
    
    var image: String? = "1-9"
    
    // MARK: - CODE
    override func viewDidLoad() {
        super.viewDidLoad()

        setTextFieldUI()
        setSavedUserInfo()
        let userImage = UserDefaults.standard.string(forKey: "profileImage")
        image = userImage == nil ? "1-9" : userImage!
        profileImage.image = UIImage(named: image!)
        
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        // 저장버튼 누르면 키보드 내려가기
        view.endEditing(true)
        
        let inputName: String? = nameText.text
        let inputHeight = heightText.text != nil ? Double(heightText.text!) : 0.0
        let inputWeight = weightText.text != nil ? Double(weightText.text!) : 0.0
        
        
         
        if inputName == "" {
            nameText.placeholder = "정확한 이름을 설정해 주세요"
            wrongValue(highlight: nameText)
        } else if inputHeight == 0.0 || inputHeight == nil {
            wrongValue(highlight: heightText)
            heightText.placeholder = "정확한 키(cm)를 설정해 주세요"
        } else if inputWeight == 0.0 || inputWeight == nil {
            wrongValue(highlight: weightText)
            weightText.placeholder = "정확한 몸무게(kg)를 설정해 주세요"
        } else {
            setTextFieldUI()
            saveUserInfo(userName: inputName!, userHeight: inputHeight!, userWeight: inputWeight!)
        }
    }
    
    func wrongValue(highlight: HoshiTextField) {
        setTextFieldUI() //다른 영역 기본 설정
        highlight.borderInactiveColor = UIColor.red
        highlight.placeholderColor = UIColor.red
    }
    func saveUserInfo(userName: String, userHeight: Double, userWeight: Double) {
        
        UserDefaults.standard.set(userName, forKey: "name")
        UserDefaults.standard.set(userHeight, forKey: "height")
        UserDefaults.standard.set(userWeight, forKey: "weight")
        UserDefaults.standard.set((userHeight+userWeight) * 10, forKey: "goalWater")
        UserDefaults.standard.set(0, forKey: "currentWater")
        
        let userName = UserDefaults.standard.string(forKey: "name")
        let userHeight = UserDefaults.standard.double(forKey: "height")
        let userWeight = UserDefaults.standard.integer(forKey: "weight")
        let userGoalml = UserDefaults.standard.integer(forKey: "goalWater")
        let userGoalL = String(format: "%.1f", Double(userGoalml) * 0.001)
        
        // 저장되었다는 알림
        let alert = UIAlertController(title: "저장되었습니다.", message: "\(userName!)님의 \n하루 목표 물 섭취량: \(userGoalL)L", preferredStyle: .alert)
        let ok = UIAlertAction(title: "물마시러 갈래요!", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
        setSavedUserInfo()

    }
    
    // UI에 저장하기
    func setSavedUserInfo() {
        
        nameText.text = UserDefaults.standard.string(forKey: "name")
        heightText.text = UserDefaults.standard.string(forKey: "height")
        weightText.text = UserDefaults.standard.string(forKey: "weight")
    }


    // MARK: - UI
    func setTextFieldUI() {
        nameText.placeholder = "닉네임을 설정해 주세요"
        heightText.placeholder = "키(cm)를 설정해 주세요"
        weightText.placeholder = "몸무게(kg)를 설정해 주세요"
        setTextFieldColor(textField: nameText)
        setTextFieldColor(textField: heightText)
        setTextFieldColor(textField: weightText)
    }

    func setTextFieldColor(textField: HoshiTextField) {
        textField.borderInactiveColor = UIColor.white
        textField.borderActiveColor = UIColor.white
        textField.placeholderColor = UIColor.white
        textField.placeholderFontScale = 1
        textField.textColor = UIColor.white
    }

}
