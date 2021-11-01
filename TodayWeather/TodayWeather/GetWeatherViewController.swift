//
//  ViewController.swift
//  SeSAC_Week05
//
//  Created by minjoohehe on 2021/10/25.
//

import UIKit
import Alamofire
import SwiftyJSON

extension UIViewController {
    func getCurrentWeather() {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(WeatherViewController.currentLocation.latitude)&lon=\(WeatherViewController.currentLocation.longitude)&appid=3d8d82f6a9de680db72154214d5fbea1"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            
            case .failure(let error):
                print(error)
            }
        }
    }
}

