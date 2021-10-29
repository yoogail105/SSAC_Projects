//
//  SSAC_TrendMedia++Buldle.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/30.
//

import Foundation

import Foundation

extension Bundle {

    
    var NAVER_SECRET: String {
        
        var NAVER_SECRET: String {
            guard let file = self.path(forResource: "NaverMovieInfo", ofType: "plist") else {return ""}
            guard let resource  = NSDictionary(contentsOfFile: file) else { return""}
            guard let key = resource["NAVER_SECRET_KEY"] as? String else { fatalError("NaverMovieInfo.plist에 API_KEY 설정을 해주세요.")}
            return key
            
        guard let file = self.path(forResource: "NaverMovieInfo", ofType: "plist") else {return ""}
        guard let resource  = NSDictionary(contentsOfFile: file) else { return""}
        guard let key = resource["NAVER_SECRET_KEY"] as? String else { fatalError("NaverMovieInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    
    }
}

