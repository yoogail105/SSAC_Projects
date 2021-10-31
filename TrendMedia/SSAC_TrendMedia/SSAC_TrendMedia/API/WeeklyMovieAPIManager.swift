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
//        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=1bcbf4f171ad3cba243171af3df6ea38&language=en-US&display=10&start=\(startPage)"
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

