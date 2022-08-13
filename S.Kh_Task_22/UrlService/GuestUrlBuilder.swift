//
//  GuestUrlBuilder.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation

class GuestUrlBuilder: Request, DataUrl {
    
    static let shared = GuestUrlBuilder()
    static let guestSessionId = "guestSessionId"
    
    private var component: URLComponents?
    private(set) var urlString: String
    private(set) var urlRequest: URLRequest?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.guestUrl.rawValue
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        component = URLComponents(string: urlString)
        if var component = component {
            self.urlRequest = url(requestMethod: .GET, urlComponent: &component)
        }
    }
    
}
