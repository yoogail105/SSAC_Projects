//
//  BeerAPIManager.swift
//  TodayBeerRecommendation
//
//  Created by 성민주민주 on 2022/01/03.
//

import UIKit
import Alamofire

class BeerAPIManager {
    
    static let shared = BeerAPIManager()
    
    /* 코딩키를 사용하지 않고, keyDecodingStrategy를 사용할 경우 https://stackoverflow.com/questions/58776083/ios-swift-codable-not-working-with-alamofire-for-json-nested-data
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
     
     // decoder: decoder로 바꾸어 준다.
     */
    
    func fetchBeerData(completionHandler: @escaping (Beer) -> ()) {
        
        print(#function)
        let url = Config.baseURL
        let request = AF.request(url) //default: .get
       
        
        request.validate().responseDecodable(of: [Beer].self, decoder: JSONDecoder()) { response in
            
            switch response.result {
                // 통신 성공
            case .success(let beerResult):
                guard let beer = response.value else { return }
                dump(beer[0])
                
                completionHandler(beer[0])
                
                // 통신 실패
            case .failure(let error):
                print("fetchBeerDataError:", error)
            }
            
        }
    }
    
}

