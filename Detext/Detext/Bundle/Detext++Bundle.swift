//
//  Detext++Bundle.swift
//  Detext
//
//  Created by minjoohehe on 2021/10/28.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "OCRInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else {return "" }
        guard let key = resource["API_KEY"] as? String else {  fatalError("OCRInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
}
