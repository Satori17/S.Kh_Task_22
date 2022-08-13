//
//  MovieUrlBuilder.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation


class TVShowUrlBuilder: Request, DataUrl {
    
    static let shared = TVShowUrlBuilder()
    static var page: Int = 1
    //protocol properties
    private(set) var urlString: String
    private(set) var urlRequest: URLRequest?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.tvShowUrl.rawValue
    }
    
    private func getComponents(withPath path: String) -> URLComponents? {
        var urlComponent = URLComponents(string: path)
        urlComponent?.queryItems = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "\(TVShowUrlBuilder.page)")
        ]
     
        return urlComponent
    }
        
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        if var components = getComponents(withPath: urlString) {
            self.urlRequest = url(requestMethod: .GET, urlComponent: &components)
        }
    }
    
}


