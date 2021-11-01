//
//  TMDBMovieAPIManager.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/31.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeeklyMovieAPIManager {
    static let shared = WeeklyMovieAPIManager()
    
    func fetchWeeklyMovieData2 (Keyword: String, startPage: Int, result: @escaping (JSON) -> () ) {
        
        let url = Endpoint.WeeklyPopularURL
        print(url)
       
        AF.request(url, method: .get) .validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                result(json)
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    func fetchWeeklyMovieData(result: @escaping (JSON) -> () ) {
        
        let url = Endpoint.WeeklyPopularURL
        print(url)

        AF.request(url, method: .get) .validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                result(json)
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    
}

