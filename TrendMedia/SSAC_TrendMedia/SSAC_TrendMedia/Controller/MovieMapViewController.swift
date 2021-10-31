//
//  MovieMapViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/21.
//

import UIKit
import MapKit
import CoreLocation
import CoreLocationUI

class MovieMapViewController: UIViewController {
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var currnetLocationTitle: UINavigationItem!
    @IBOutlet weak var movieMapView: MKMapView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    let theaterData = TheaterData()
    let  locationManager = CLLocationManager()
    var authorization = false
    var cgvAnnotations: [MKAnnotation] = []
    var lotteCinemaAnnotations: [MKAnnotation] = []
    var megaBoxAnnotations : [MKAnnotation] = []
    var allAnnotations:[MKAnnotation] = []

    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. CoreLocation delegate위임
        locationManager.delegate = self
        movieMapView.delegate = self
        
        
        // 로케이션의 기준점 설정하기
        // 서울시청: 37.566403559824955, 126.97794018074802
        let location = CLLocationCoordinate2D(latitude: 37.566403559824955, longitude: 126.97794018074802)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        movieMapView.setRegion(region, animated: true)
        
        // 허용하지 않으면 서울시청
        let annotation = MKPointAnnotation()
        annotation.title = "서울시청"
        annotation.coordinate = location
        movieMapView.addAnnotation(annotation)
        
        
        // MARK: - 전체 영화관 리스트 어노테이션 -> 어노테이션 분류
        for i in theaterData.theater {
            
            let theaterAnnotation = MKPointAnnotation()
            theaterAnnotation.title = i.theaterTitle
            print(i.theaterTitle)
            theaterAnnotation.coordinate = CLLocationCoordinate2D(latitude: i.location.0, longitude: i.location.1)
            
            switch i.type {
            case .megabox:
                megaBoxAnnotations.append(theaterAnnotation)
            case .lotteCinema:
                lotteCinemaAnnotations.append(theaterAnnotation)
            case .cgv:
                cgvAnnotations.append(theaterAnnotation)
            }
            
            movieMapView.addAnnotation(theaterAnnotation)
            // 전체 allAnnotation 넣어두기
            allAnnotations.append(theaterAnnotation)
        }
        
        
        checkUserLoactionServicesAuthorization()
        
        // MARK: - UI Setting
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
      //  navigationItem.title = getCurrentAddress(location: <#T##CLLocation#>)
        currentLocationButton.tintColor = .green
        filterButton.tintColor = .black
        
        
        
    }
    @IBAction func currentLocationButtonClicked(_ sender: UIButton) {
        checkUserLoactionServicesAuthorization()
        if authorization != true {
            locationSettingAlert()
        }
    }
    
    func locationSettingAlert() {
        showAlert(title: "위치 서비스를 사용할 수 없습니다.", message: "지도에서 내 위치를 확인하여 주변 영화관 정보를 얻기 위해 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요.", okTitle: "설정으로 이동") {
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
    
    func hideAllAnnotation(deselectedAnnotations: [MKAnnotation]) {
        for annotaton in deselectedAnnotations {
            self.movieMapView.view(for: annotaton)?.isHidden = true
        }
    }
    // func showAllAnnotation(selectedAnnotations: [MKAnnotation], hideMegabox: Bool, hideLottecinema: Bool, hideCgv: Bool)
    func showAllAnnotation() {
        for annotaton in allAnnotations {
            self.movieMapView.view(for: annotaton)?.isHidden = false
        }
    }
    
    func showAllAnnotation(selectedAnnotations: [MKAnnotation]) {
        //super.showAllAnnotation
        for annotaton in allAnnotations {
            self.movieMapView.view(for: annotaton)?.isHidden = true
        }
        
        for selectedAnnotation in selectedAnnotations {
            self.movieMapView.view(for: selectedAnnotation)?.isHidden = false
        }
    }
    
    // MARK: - FilterButtonClicked
    @IBAction func filterButtonClicked(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let megabox = UIAlertAction(title: "메가박스", style: .default) { _ in
            self.showAllAnnotation(selectedAnnotations: self.megaBoxAnnotations)
        }
        let lotteCinema = UIAlertAction(title: "롯데시네마", style: .default) { _ in
            self.showAllAnnotation(selectedAnnotations: self.lotteCinemaAnnotations)
        }
        let cgv = UIAlertAction(title: "CGV", style: .default) { _ in
            self.showAllAnnotation(selectedAnnotations: self.cgvAnnotations)
        }
        
        let all = UIAlertAction(title: "전체보기", style: .default) { _ in
            self.showAllAnnotation()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(megabox)
        alert.addAction(lotteCinema)
        alert.addAction(cgv)
        alert.addAction(all)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    // 네비게이션 타이틀에 주소 입력
    func getCurrentAddress(currnetLocation: CLLocationCoordinate2D) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: currnetLocation.latitude, longitude: currnetLocation.longitude)
        let locale = Locale(identifier: "Ko-kr")
        var address = (gu: "00구", dong: "00동")
        geoCoder.reverseGeocodeLocation(location, preferredLocale: locale, completionHandler:  { (placemark, error)-> Void in
            guard error == nil, let place = placemark?.first else {
                print("주소 설정 불가능")
                return
            }
            if let locality =  place.locality {
                address.gu = locality
            }
            if let subLocality = place.subLocality {
                address.dong = subLocality
            }
            self.navigationItem.title = "\(address.gu) \(address.dong)"
        })
        
    }
    
    
} //: MovieMapViewController

// MARK: - MapView + Extension
// MARK: - locationManagerDelegate
extension MovieMapViewController: CLLocationManagerDelegate {
    
    // MARK: - 9. ios별 위치 서비스 여부: checkUserLocationStatus
    func checkUserLoactionServicesAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
    
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
                //            case .fullAccuracy:
                //
            case .reducedAccuracy:
                print("reduce")
                
            @unknown default:
                print("default")
            }
        }
    }
    
    // MARK: - 1. didUpdateLocations: 사용자가 위치 허용을 했다면
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print(locations)
        
        if let coordinate = locations.last?.coordinate { //주소가 있다면
            let annotation = MKPointAnnotation()
            annotation.title = "CURRENT LOCATION"
            annotation.coordinate = coordinate
            movieMapView.addAnnotation(annotation)
            //currnetLocationTitle.title = annotation.coordinate
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            movieMapView.setRegion(region, animated: true)
                
            getCurrentAddress(currnetLocation: coordinate)
            //10.위치업데이트 기준
            locationManager.stopUpdatingLocation()
            
        
            
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

extension MovieMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    }
}

