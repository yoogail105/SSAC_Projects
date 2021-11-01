//
//  CrewAPIMananger.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/11/01.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieCrewAPIMananger {
    static let shared = MovieCrewAPIMananger()
    
    var startPage = 1
    
    func fetchMoviewData(result: @escaping (JSON) -> () ) {
        let url = Endpoint.NaverMovieURL

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


