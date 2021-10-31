//
//  movieDetails.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/31.
//
import Foundation
import Alamofire
import SwiftyJSON

class MovieDetailsAPIManager {
    static let shared = MovieDetailsAPIManager()
    
    func fetchMovieData(result: @escaping (JSON) -> () ) {
        let url = Endpoint.MovieDetailsURL
        
        let header: HTTPHeaders = [ "api_key": APIKey.TMDB_API,
                                    //language: Pass a ISO 639-1 value to display translated data for the fields that support it.
                                    "language": "en-US"
        ]
        
        
        AF.request(url, method: .get, headers: header).validate().responseJSON {
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
