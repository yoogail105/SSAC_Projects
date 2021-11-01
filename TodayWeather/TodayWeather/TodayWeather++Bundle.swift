//
//  TodayWeather++Bundle.swift
//  TodayWeather
//
//  Created by minjoohehe on 2021/10/28.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "WeatherInfo", ofType: "plist") else {return ""}
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("WeartherInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
}
