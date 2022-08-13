//
//  Fetcher.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation
import UIKit

enum FetchingError: String, Error {
    
    case requestError = "Could not fetch data with request"
    case responseError = "Wrong Response"
    case statusCodeError = "Unsucessful response status code"
    case dataError = "Could not get data when decoding"
    case urlComponentError = "There's an error in url components"
}

enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class Fetcher {
    
    static let shared = Fetcher()
    let session = URLSession(configuration: .default)
    
    
    func fetchData<T: Codable, O: DataUrl>(with urlBuilder: O, as model: T.Type, onCompletion: @escaping (T) -> Void, fail: @escaping (String) -> ()) {
        
        guard let request = urlBuilder.urlRequest else {
            fail(FetchingError.urlComponentError.rawValue)
            return
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            if let _ = error {
                fail(FetchingError.requestError.rawValue)
            }
            
            guard let response = response as? HTTPURLResponse else {
                fail(FetchingError.responseError.rawValue)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                fail(FetchingError.statusCodeError.rawValue)
                return
            }
            
            if let data = data {
                //Parsing JSON
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(model, from: data)
                    DispatchQueue.main.async {
                        onCompletion(fetchedData)
                    }
                } catch {
                    fail(FetchingError.dataError.rawValue)
                    print(error.localizedDescription)
                    
                }
            }
        }
        //API call
        task.resume()
    }
    
    func fetchImage(with urlPath: String, imageView: UIImageView) {
        let currentImage = ImageUrlBuilder(identifier: urlPath)
        let url = URL(string: currentImage.urlString)
        
        if let urlSource = url {
            let task = session.dataTask(with: urlSource) { data, response, error in
                
                if error == nil, let data = data {
                    do {
                        DispatchQueue.main.async {
                            imageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
