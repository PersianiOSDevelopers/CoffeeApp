//
//  ServiceLayer.swift
//  ManualNetworking
//
//  Created by Amir Tutunchi on 9/29/19.
//  Copyright © 2019 kasra. All rights reserved.
//

import Foundation
import UIKit

typealias Parameters = [String: String]


class ServiceLayer  {
    private var session : URLSession!
    private let decoder = JSONDecoder()
    static let sharedInstance = ServiceLayer()
    private init() {
        /// create and config urlsession configuration
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        config.timeoutIntervalForResource = 20
        /// create and config urlsession
        self.session = URLSession(configuration: config, delegate: nil, delegateQueue: .main)
    }
    
    
    /// this function is used to validate server response and check whether every thing is ok or not
    private func validate(response : HTTPURLResponse? , data : Data?) throws -> Data{
        let errorResponse = data.flatMap( {try? decoder.decode(ErrorResponse.self, from: $0)})
//        let a = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//        print(a)
        guard let response = response else {
            throw ServiceError.invalidResponse
        }
        switch  response.statusCode {
        case 401:
            throw  ServiceError.badToken(message: errorResponse?.message)
        case 400...600:
//            GenearalAlertManager.showAlert(title: "Error", message: errorResponse?.message ?? "")
            throw ServiceError.badHTTPStatus(status: response.statusCode, message: errorResponse?.message)
        default:
            break
        }
        guard let data = data else {
            throw ServiceError.invalidResponse
        }
        return data
    }
    /// this function is for creating UrlComponents object
    private func createBaseURLComponent(router : Router ) -> URLComponents{
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        if router.port != 80{
            components.port = router.port
        }
        components.queryItems = router.parameters
        return components
    }
    /// this function creates URLRequest object for every request we need
    private func createUrlRequest(router : Router , components : URLComponents)-> URLRequest{
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = router.method
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        return urlRequest
    }
    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {
        let components = createBaseURLComponent(router : router)
        let urlRequest = createUrlRequest(router: router, components: components)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            do{
                if let error = error {throw error}
                let data = try self.validate(response: response as? HTTPURLResponse, data: data)
                let result =  try  self.decoder.decode(T.self, from: data)
                completion(.success(result))
            }
            catch{
            
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}

