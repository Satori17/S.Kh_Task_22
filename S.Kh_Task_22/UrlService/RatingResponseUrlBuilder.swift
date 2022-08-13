//
//  RatingResponseUrlBuilder.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation

class RatingResponseUrlBuilder: Request, DataUrl {
    
    static let shared = RatingResponseUrlBuilder()
    static var tvShowId: Int!
    static var rating = 0.0
    
    var urlString: String
    var urlRequest: URLRequest?
    func withBaseUrl() {
        self.urlString = BaseUrl.rateUrl.rawValue
    }
    
    private func withTVShowId(id: Int) {
        self.urlString += "\(id)/"
    }
    
    private func withPath() {
        self.urlString += "rating?"
    }
    
    func getComponents(withPath path: String) -> URLComponents? {
        let guestSessionId = UserDefaults.standard.value(forKey: GuestUrlBuilder.guestSessionId)
        guard let guestSessionId = guestSessionId else { return nil }
        var urlComponent = URLComponents(string: path)
        urlComponent?.queryItems = [
            URLQueryItem(name: "guest_session_id", value: "\(guestSessionId)"),
            URLQueryItem(name: "value", value: "\(RatingResponseUrlBuilder.rating)")
        ]
     
        return urlComponent
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        withTVShowId(id: RatingResponseUrlBuilder.tvShowId)
        withPath()
        if var components = getComponents(withPath: urlString) {
            self.urlRequest = url(requestMethod: .POST, urlComponent: &components)
        }
    }
    
}
