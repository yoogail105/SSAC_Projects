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
    
    
    func fetchOCRData(image: UIImage, result: @escaping (Int, String) -> () ) {
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.KAKAO
        ]
        
        
        guard let imageData = image.pngData() else { return }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image")
        }, to: Endpoint.OCRURL, headers: header)
            .validate(statusCode: 200...500).responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    
                    var detectedString = ""
                    var detectedTextSet: [String] = []
                    let json = JSON(value)
                    print("JSON: \(json)")
                    for words in json["result"].arrayValue {
                        let detectedWords = words["recognition_words"][0].stringValue
                        print("words: \(detectedWords)")
                        detectedTextSet.append(detectedWords)
                    }
                    detectedString = detectedTextSet.joined(separator: " ")
                    print("OCR: \(detectedString)")
                    
                    
                    let code = response.response?.statusCode ?? 500
                    
                    result(code, detectedString)
                    
                case .failure(let error):
                    print(error)
                }
                
                
            }
    }
}

