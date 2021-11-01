//
//  Constants.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/30.
//

import Foundation
var startPage = 2
var credit_id = 0
var queue = ""

struct APIKey {
    static let NAVER_ID = Bundle.main.NAVER_ID
    static let NAVER_SECRET = Bundle.main.NAVER_SECRET
    static let TMDB_API = Bundle.main.TMDB_API
}

// API가 서버에서 자원(resource)에 접근할 수 있도록 하는 URL
struct Endpoint {
    // otherview cannot use
    static let NaverMovieURL = "https://openapi.naver.com/v1/search/movie.json?query=\(queue)&display=10&start=\(startPage)"
    static let WeeklyPopularURL =
    "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.TMDB_API)&language=en-US&display=10&start=\(startPage)"
    static let MovieImageURL = "https://image.tmdb.org/t/p/original/"
    static let MovieGenresURL =
    "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey.TMDB_API)&language=en-US"
    static let MovieDetailsURL = "https://api.themoviedb.org/3/movie/{movie_id}?api_key=\(APIKey.TMDB_API)&language=en-US"
    
    static let MovieCrewURL = "https://api.themoviedb.org/3/credit/\(credit_id)?api_key==\(APIKey.TMDB_API)"
}


