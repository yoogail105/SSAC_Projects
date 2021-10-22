//
//  TheaterModel.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/21.
//

struct Theater {
    let title: String
    let location: (Double, Double)
    let type: Type
    let distance: Double
}


enum Type: String {
    case megabox = "메가박스"
    case lotteCinema = "롯데시네마"
    case cgv = "CGV"
}
