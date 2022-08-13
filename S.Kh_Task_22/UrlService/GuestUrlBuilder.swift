//
//  GuestUrlBuilder.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation

class GuestUrlBuilder: Request, DataUrl {
    
    
    static let shared = GuestUrlBuilder()

    private(set) var urlString: String
    private(set) var component: URLComponents?
    
    var urlRequest: URLRequest?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.guestUrl.rawValue
    }
    
    func withBaseComponent() {
        if let component = URLComponents(string: urlString) {
            self.component = component
        }
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        withBaseComponent()
        self.urlRequest = url(requestMethod: .GET, urlComponent: &component!)
    }
    
}
