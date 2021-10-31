//
//  SSAC_TrendMedia++Buldle.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/30.
//

import Foundation
let resource = "NaverMovieInfo"

extension Bundle {
    
    
    var NAVER_ID: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource  = NSDictionary(contentsOfFile: file) else { return""}
        guard let key = resource["NAVER_ID"] as? String else { fatalError("NaverMovieInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
    
    var NAVER_SECRET: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource  = NSDictionary(contentsOfFile: file) else { return""}
        guard let key = resource["NAVER_SECRET_KEY"] as? String else { fatalError("NaverMovieInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
        
    }
    
    
    var TMDB_API: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["TMDB_API"] as? String else { fatalError("NaverMovieInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
    
}
