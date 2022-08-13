//
//  MovieModel.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation


struct TVShowModel: Codable {
    let firstReleaseDate: String?
    //let genreIDS: [Int]
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case firstReleaseDate = "first_air_date"
        //case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
