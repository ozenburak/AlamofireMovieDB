//
//  MovieData.swift
//  AlamofireMovieExample
//
//  Created by burak ozen on 2.12.2021.
//

import Foundation
// MARK: - MovieResponse
struct MovieResponse: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

