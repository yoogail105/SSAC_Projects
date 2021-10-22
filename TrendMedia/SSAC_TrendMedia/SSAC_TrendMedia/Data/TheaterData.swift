//
//  theater.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/21.
//

/*
 struct Theater {
     let title: String
     let location: (Double, Double)
     let type: Type
     let distance: Double
 }
 */

import Foundation

struct TheaterData {
    let theater: [Theater] = [
        Theater(title: "CGV 죽전", location: (37.32621062922653, 127.10771817045762), type: .cgv, distance: 0.0),
        Theater(title: "CGV 동백", location: (37.28176099015004, 127.14971081062683), type: .cgv, distance: 0.0),
        Theater(title: "메가박스 용인테크노밸리", location: (37.29746664642458, 127.13271633436715), type: .megabox, distance: 0.0),
        Theater(title: "롯데시네마 수지", location: (37.31436366525552, 127.0816723842505), type: .lotteCinema, distance: 0.0),
        Theater(title: "CGV 기흥", location: (37.28097306921681, 127.1173779441973), type: .cgv, distance: 0.0)
        
    ]
}
