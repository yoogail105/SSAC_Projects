//
//  MovieModel.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/27.
//

import Foundation

//가지고 오고 싶은 내용 넣어주기
// class면 초기화 필요, struct는 값 타입이기 때문에 모델에 더 적합
struct MovieModel  {
    var titleData: String
    var imageData: String
    var linkData: String
    var userRatingData: String
    var subtitle: String
}
