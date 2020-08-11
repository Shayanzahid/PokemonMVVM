//
//  Webservice.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
