//
//  TMDBMovieModel.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/31.
//

import Foundation

struct TMDBMovieModel  {
    var id: Int
    var movieTitle: String //title
    var voteAverage: Double
    var overview: String
    var releaseDate: String
  //  var genreIds: [Int]  //
    var backdropPath: String //image
    var posterPath: String //image
}
