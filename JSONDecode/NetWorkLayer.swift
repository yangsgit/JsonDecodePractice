//
//  NetWorkLayer.swift
//  JSONDecode
//
//  Created by Yang Li on 12/2/20.
//

import Foundation

class NetWork {
    func webResource(url: URL, completionHandler: @escaping (Data) -> Void) {
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completionHandler(data)
            }
        }.resume()
    }
}
