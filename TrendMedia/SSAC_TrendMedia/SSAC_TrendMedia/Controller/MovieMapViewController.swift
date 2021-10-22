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
    var authorization = false
    @IBOutlet weak var currentLocationButton: UIButton!
    
    @IBOutlet weak var currnetLocationTitle: UINavigationItem!
    
    @IBOutlet weak var movieMapView: MKMapView!
    let theaterData = TheaterData()
   
   
    let  locationManager = CLLocationManager()
   
    
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
    
        
        // MARK: - 전체 영화관 리스트 어노테이션
        for i in theaterData.theater {
            let theaterAnnotation = MKPointAnnotation()
            theaterAnnotation.title = i.theaterTitle
            print(i.theaterTitle)
            theaterAnnotation.coordinate = CLLocationCoordinate2D(latitude: i.location.0, longitude: i.location.1)
            movieMapView.addAnnotation(theaterAnnotation)
            //moviewMapView.addAnnotations(annotations) ?
        }
        
        checkUserLoactionServicesAuthorization()
        
    
    }
    @IBAction func currentLocationButtonClicked(_ sender: UIButton) {
        checkUserLoactionServicesAuthorization()
        if authorization != true {
        showAlert(title: "설정으로 이동", message: "권한 허용해주세요", okTitle: "설정으로 이동") {
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url) { success in
                    print("잘 열렸다\(success)")
                }
            }
        }
        }
    }
}

// MARK: - MapView + Extension

extension MovieMapViewController: CLLocationManagerDelegate {
    
    // MARK: - 9. ios별 위치 서비스 여부
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
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation() //-> didUpdatedLocations
        case .restricted, .denied:
            print("Denied, 설정으로 유도")
     
        case .authorizedWhenInUse:
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
    
    // MARK: - 1.사용자가 위치 허용을 했다면 didUpdateLocations
    
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
    
}

extension MovieMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("영화관 선택!")
    }
    
}
