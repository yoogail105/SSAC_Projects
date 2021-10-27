//
//  OCRAPIMannager.swift
//  Detext
//
//  Created by minjoohehe on 2021/10/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class OCRAPIManager {
    
    static let shared = OCRAPIManager()
    
    func fetchFaceData(image: UIImage, result: @escaping (Int, JSON) -> () ) {
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.KAKAO
        ]
        
        // UIImage를 바이너리 타입으로 변환
        guard let imageData = image.pngData() else { return }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image")
        }, to: Endpoint.OCRURL, headers: header) //endpoint: visionURL로 보낼래
            .validate(statusCode: 200...500).responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    print("JSON: \(json)")
//                    for words in json["result"]["boxes"].arrayValue {
//                        let detectedWords = words["recognition_words"].stringValue
//                        print(detectedWords)
//                    }
                    
                    // 500: 서버 오류, 다른 넘버 사용해도 된다.
                    let code = response.response?.statusCode ?? 500
                    result(code, json)
                case .failure(let error): //wifi꺼두거나, 네이버의 서비스 점검 등을 통해서 요청을 받을 수 없는 경우: 네트워크 통신 실패
                    print(error)
                }
                
                
            }
    }
}
