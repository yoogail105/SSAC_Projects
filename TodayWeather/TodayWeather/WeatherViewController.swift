//
//  WeatherViewController.swift
//  TodayWeather
//
//  Created by minjoohehe on 2021/10/26.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var currentLocationLable: UILabel!
    @IBOutlet weak var currenTempLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentWidSpeedLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 위임
        locationManager.delegate = self
        
        todayDate()
        
    }
    
    func todayDate() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 a hh시 mm분"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let nowDateStr = dateFormatter.string(from: nowDate)
        todayDateLabel.text = nowDateStr
    }

}
