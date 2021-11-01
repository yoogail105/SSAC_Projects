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
    var authorization = false
    // 기본세팅: 서울시청
    static var currentLocation = CLLocationCoordinate2D(latitude: 37.566403559824955, longitude: 126.97794018074802)

    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 위임
        locationManager.delegate = self
        todayDate()
    
        //현재 위치 확인
        checkUserLoactionServicesAuthorization()
   
    } //: VIEWDIDLOAD
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(true)
    
        //왜 ui업데이트안되는것..?ㅜ
        checkUserLoactionServicesAuthorization()
        setUI()
    
    }
    
    
    @IBAction func locationButtonClicked(_ sender: UIButton) {
        checkUserLoactionServicesAuthorization()
        if authorization != true {
            locationSettingAlert()
        }
    }
    
    func todayDate() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 a hh시 mm분"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let nowDateStr = dateFormatter.string(from: nowDate)
        todayDateLabel.text = nowDateStr
    }
    
    func setUI() {
        
    }
    
    // 위경도 -> 한국어 주소 변환
    func getCurrentAddress(location: CLLocation) {
        
        let geoCoder: CLGeocoder = CLGeocoder()
        let location: CLLocation = location
        
        let locale = Locale(identifier: "Ko-kr")
        
        var addressStr = (city: "서울특별시", street: "중구")
       
        geoCoder.reverseGeocodeLocation(location, preferredLocale: locale, completionHandler:  { (placemark, error)-> Void in
            guard error == nil, let place = placemark?.first else {
                print("주소 설정 불가능")
                return
            }
            
            if let administrativeArea = place.administrativeArea {
                print(administrativeArea)
                addressStr.city = administrativeArea
            }
            
            if let locality =  place.locality {
                print(locality)
            }
            
            if let subLocality = place.subLocality {
                print(subLocality)
                addressStr.street = subLocality
            }
            if let subThoroughfare = place.subThoroughfare {
                print(subThoroughfare)
            }
        })
        
        currentLocationLable.text = "\(addressStr.city), \(addressStr.street)"
        print("\(addressStr.city), \(addressStr.street)")
        
    }
    
    func locationSettingAlert() {
        showAlert(title: "위치 서비스를 사용할 수 없습니다.", message: "지도에서 내 위치를 확인하여 https://evan-moon.github.io/2020/04/07/about-restful-api/ 정보를 얻기 위해 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요.", okTitle: "설정으로 이동") {
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url) { success in
                    print("설정으로 이동했습니다.")
                }
            }
            
        }
    } //: locationSettingAlert

}

extension WeatherViewController: CLLocationManagerDelegate {
    
   
    
    // MARK: - 9. ios별 위치 서비스 여부: checkUserLocationStatus
    func checkUserLoactionServicesAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
            locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            // 상황에 맞는 케이스 실행
            checkCurrentLocationAuthorization(authorizationStatus)
        } else {
            print("iOS 위치 서비스를 켜주세요 alert")
            
        }
    }
    
    // MARK: - 8. 현재 권한 확인하는 함수: CLAuthorizationStatus
    func checkCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        
        switch authorizationStatus {
        case .notDetermined:
            authorization = false
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation() //-> didUpdatedLocations
        case .restricted, .denied:
            authorization = false
            print("Denied, 설정으로 유도")
            
        case .authorizedWhenInUse:
            authorization = true

            locationManager.startUpdatingLocation() //-> didUpdatedLocations
            
        case .authorizedAlways:
            print("always")
            authorization = true
        @unknown default:
            print("default")
        }
        
        if #available(iOS 14.0, *) {
            let accurancyState = locationManager.accuracyAuthorization
            
            switch accurancyState {
            case .reducedAccuracy:
                print("reduce")
                
            case .fullAccuracy:
                print("fullAccuraty")
            @unknown default:
                print("default")
            }
        }
    }
    
    // MARK: - 1. didUpdateLocations: 사용자가 위치 허용을 했다면
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print(locations)
        
        if let coordinate = locations.last?.coordinate {
            getCurrentAddress(location: locations[0])
            WeatherViewController.currentLocation = coordinate
            getCurrentWeather()
            
            
            //10.위치업데이트 기준
       //     locationManager.stopUpdatingLocation()
            
        
            
        } else { // 주소가 없다면
            print("Loaction Cannot Find: 설정 얼럿 띄우기")
        }
        
    }
    // MARK: - 2. 허용했지만 실패한 경우: didFailWithError
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    
    // MARK: - 3.앱 처음 실행, 권한 변경: didChangeAuthorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        //check
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        //check
    }
    
    
}//: extension MovieMapViewController: CLLocationManagerDelegate
