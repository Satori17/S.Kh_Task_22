//
//  Request.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation


class Request {
    
    func url(requestMethod method: RequestMethod, urlComponent: inout URLComponents) -> URLRequest? {
        urlComponent.queryItems?.append(URLQueryItem(name: "api_key", value: apikey))
        
        guard let url = urlComponent.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
    
}
