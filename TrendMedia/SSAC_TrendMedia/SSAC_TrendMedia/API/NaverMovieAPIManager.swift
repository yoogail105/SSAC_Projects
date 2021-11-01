//
//  NaverMovieAPIManager.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/11/01.
//
import Foundation
import Alamofire
import SwiftyJSON

class NaverMovieAPIManager {
    static let shared = NaverMovieAPIManager()
    
    func findRepositories(matching query: String) {
        let api = "https://api.github.com"
        let endpoint = "/search/repositories?q=\(query)"
        let url = URL(string: api + endpoint)
        
    }
    
    enum Sorting: String {
        case numberOfStars = "stars"
        case numberOfForks = "forks"
        case recency = "updated"
    
    
    func fetchWeeklyMovieData(searchWord: String, startPage: Int, result: @escaping (JSON) -> () ) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "openapi.naver.com"
        components.path = "search/movie.json"
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "dispaly", value: )
        ]
        let url = "Endpoint.WeeklyPopularURL"
//        let url = "https://openapi.naver.com/v1/search/movie.json?query=\(queue)&display=10&start=\(startPage)"\(startPage)"
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

