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
    
    var startPage = 1
    
    func fetchWeeklyMovieData(result: @escaping (JSON) -> () ) {
        let url = Endpoint.WeeklyPopularURL
        
//        let header: HTTPHeaders = [ "api_key": APIKey.TMDB_API,
//                                    "media_type": "tv",
//                                    "time_window": "week"
//        ]
//

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

