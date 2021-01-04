//
//  NetWorkLayer.swift
//  JSONDecode
//
//  Created by Yang Li on 12/2/20.
//

import Foundation

class NetWork {
    func webResource(url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler(data, error)
        }.resume()
    }
}
 
public enum HTTPRequestError: Error {
    case EmptyData
}
