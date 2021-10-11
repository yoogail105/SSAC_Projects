//
//  DrinkWaterViewController.swift
//  DrinkWater
//
//  Created by minjoohehe on 2021/10/09.
//

import UIKit


class DrinkWaterViewController: UIViewController {
    // MARK: - PROPERTIES
    
    //NavigatonBar Button
    
 
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var todayWaterLabel: UILabel!
    @IBOutlet var percentWaterLabel: UILabel!
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var addWaterText: UITextField!
    
    @IBOutlet var informGoalLabel: UILabel!
    @IBOutlet var drinkWaterButton: UIButton!
    
    //userData
    var name:String?
    var waterGoal: Int?
    var drinkedWater: Int?
    var waterPercentage: Int?
    var userGoalL: String = ""
    
    //var goalMl: Int = 0
    //var goalL: String = ""
    //var percentage: Double = 0
    
    //var currentWater: Int?
    
    var message = "같이 해볼까요?"
    var image = "1-9"
    var textColor = UIColor.white
    
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    let ud = UserDefaults.standard
    
    // MARK: - CODE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData()
        setMainUI()
        //updateProfileImage(percentage: Int(percentage))
        
        
        // 알림 설정
        requestNotificationAuthorization()
        
    }
    
    func getUserData() {
        //첫 접속이면 모두 nil
        name = ud.string(forKey: "name")
        waterGoal = ud.integer(forKey: "waterGoal") //첫 접속일 때 없다
        drinkedWater = ud.integer(forKey: "drinkedWater")
        waterPercentage = ud.integer(forKey: "waterPercentage")
        
        if name != nil {
            let calculateWaterPer = Double(drinkedWater!)/Double(waterGoal!) * 100
            waterPercentage = Int(round(calculateWaterPer))
            userGoalL = String(format: "%.1f", Double(waterGoal!) * 0.001)
        }
        
        updateProfileImage(percentage: waterPercentage)
        
    }
    
    
    // 알림 설정
    func requestNotificationAuthorization() {
        
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if success {
                self.sendNotification()
            }
        }
    }


    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "물 마실 시간이에요!"
        notificationContent.body = "하루 2리터 목표 달성을 위해 열심히 달려보아요"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 25, repeats: false)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notificaton Error: ", error)
            }
        }
    }
    

    func setMainUI() {
        
        // 배경 색상 설정
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        //navigationBar 색상 설정
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController?.navigationBar.standardAppearance = navigationAppearance
        self.navigationController?.navigationBar.tintColor = .white
        
        // UI 글씨 색상 설정
        //statusLabel.text = "\(name!)님이\n오늘 마신 물의 양은"
        statusLabel.textColor = textColor
        statusLabel.textAlignment = .left
        statusLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        //오늘 마신 물
        //todayWaterLabel.text = "\(drinkedWater)ml"
        todayWaterLabel.textColor = textColor
        todayWaterLabel.textAlignment = .left
        todayWaterLabel.font = .systemFont(ofSize: 35, weight: .bold)
        
        
        // 목표
        percentWaterLabel.text = String(format: "목표의 %.f%%", Double(waterPercentage!))
        percentWaterLabel.font = .systemFont(ofSize: 18, weight: .regular)
        percentWaterLabel.textAlignment = .left
        percentWaterLabel.textColor = textColor
        
        addWaterText.textColor = textColor
        addWaterText.textAlignment = .center
        
        
        informGoalLabel.textColor = .white
        informGoalLabel.textAlignment = .center
        informGoalLabel.font = .systemFont(ofSize: 10, weight: .regular)
        
        // 디폴트
        if name == nil {
            statusLabel.text = "같이 해볼까요?\n오늘 마신 물의 양은"
            todayWaterLabel.text = " ??? ml"
            percentWaterLabel.text = "목표의 ??? %"
            informGoalLabel.text = "정보를 입력하고 목표 물 섭취량을 알아봐요!"
            
        } else {
            
            statusLabel.text = "\(message)\n오늘 마신 물의 양은"
            todayWaterLabel.text = "\(drinkedWater!)ml"
            percentWaterLabel.text = String(format: "목표의 %.f%%", Double(waterPercentage!))
            informGoalLabel.text = "\(name!)님의 하루 목표 물 섭취량은 \(userGoalL)L입니다."
            
        }
    }

    
    //addWater: 지금 추가할 물, drinkedWater: 유저가 오늘 마신 물의 합(userData)
    @IBAction func DrinkWaterButtonClicked(_ sender: UIButton) {
        
        var addWater: Int?
        
        if addWaterText.text != "" {
            addWater = Int(addWaterText.text!)
            drinkedWater! += addWater!
            UserDefaults.standard.set(drinkedWater, forKey: "drinkedWater")
            getUserData()
            setMainUI()
            updateProfileImage(percentage: Int(waterPercentage!))
        } else {
            addWater = 0
        }
        
    }
    
    // MARK: - Image & message
    func updateProfileImage(percentage: Int!) {
        
        if 0 <= percentage && percentage < 10 {
            image = "1-1"
            message = "틈틈히 마셔요"
            textColor = UIColor.white
        } else if 10 <= percentage && percentage < 20 {
            image = "1-2"
            message = "물 마실 시간!"
        } else if 20 <= percentage && percentage < 30 {
            image = "1-3"
            message = "할 수 있어요"
        } else if 30 <= percentage && percentage < 40 {
            image = "1-4"
            message = "힘을 내요"
        } else if 40 <= percentage && percentage < 50 {
            image = "1-5"
            message = "한 잔 더 할까요"
        } else if 50 <= percentage && percentage < 60 {
            image = "1-6"
            message = "물은 맛있다"
        } else if 60 <= percentage && percentage < 75 {
            image = "1-7"
            message = "조금만 더!"
        } else if 75 <= percentage && percentage < 90 {
            image = "1-8"
            message = "거의 다 왔어요!"
        } else {
            image = "1-9"
            message = "잘하셨어요!"
            textColor = UIColor.yellow
        }
        
        UserDefaults.standard.set(image, forKey: "profileImage")
        profileImage.image = UIImage(named: image)
    }
    
    //f
    @IBAction func resetButtonClicked(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(0, forKey: "drinkedWater")
        getUserData()
        setMainUI()
    }
}

