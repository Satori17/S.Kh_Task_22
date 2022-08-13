//
//  BaseUrl.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation

let apikey = "0ff508ee2a76af47d3d9f18e0ad27d9e"

protocol DataUrl {
    var urlString: String { get }
    var urlRequest: URLRequest? { get }
    func withBaseUrl()
}


enum BaseUrl: String {
    case tvShowUrl = "https://api.themoviedb.org/3/tv/top_rated?"
    case imageUrl = "https://image.tmdb.org/t/p/"
    case guestUrl = "https://api.themoviedb.org/3/authentication/guest_session/new?"
    case rateUrl = "https://api.themoviedb.org/3/tv/"
}
