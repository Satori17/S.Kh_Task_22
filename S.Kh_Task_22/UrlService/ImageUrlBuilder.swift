//
//  ImageUrlBuilder.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import UIKit

enum ImageSize: String {
    case w300
    case w400
}

class ImageUrlBuilder: DataUrl {
    
    var urlRequest: URLRequest?
    private(set) var urlString: String
    
    func withBaseUrl() {
        self.urlString = BaseUrl.imageUrl.rawValue
    }
    
    private func withSize() {
        self.urlString += ImageSize.w300.rawValue + "/"
    }
    
    func withIdentifier(_ id: String) {
        self.urlString += id
    }
    
    init(identifier: String) {
        self.urlString = ""
        withBaseUrl()
        withSize()
        withIdentifier(identifier)
    }
    
}
