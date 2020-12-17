//
//  ServiceManager.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation

struct ServiceManager {
    static let shared = ServiceManager()
    
    // Generic function - 'T' stands for Type parameter
    func getWeatherInfo<T: Decodable> (urlString:String, completionHandler: @escaping(Result<T,NetworkError>) -> ()) {
        guard let serviceURL = URL(string: urlString) else {
            completionHandler(.failure(.badError))
            return
        }
        URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
            if let err = error {
                completionHandler(.failure(.badError))
                print(err.localizedDescription)
            } else {
                guard let data = data else { return }
                let jsonString = String(decoding: data, as: UTF8.self)
                do {
                    let results = try JSONDecoder().decode(T.self, from: jsonString.data(using: .utf8)!)
                    completionHandler(.success(results))
                } catch {
                    print(error.localizedDescription)
                    completionHandler(.failure(.badError))
                }
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case badError
}
