//
//  Constants.swift
//  TodayWeather
//
//  Created by minjoohehe on 2021/10/28.
//

import Foundation

struct APIKey {
    static let OPENWEATHER = "3d8d82f6a9de680db72154214d5fbea1"
}

struct Endpoint {
    static let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(WeatherViewController.currentLocation.latitude)&lon=\(WeatherViewController.currentLocation.longitude)&appid=\(APIKey.OPENWEATHER)"
}
