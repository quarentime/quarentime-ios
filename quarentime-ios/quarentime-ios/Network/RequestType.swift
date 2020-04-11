//
//  RequestType.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 21/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation
import Firebase

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

struct RequestData {
    
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    
    public init<T:Codable>(path: String, method: HTTPMethod = .get, params: T) {
        self.path = path
        self.method = method
        self.params = RequestData.getParams(from: params)
        self.headers = nil
    }
    
    public init(path: String, method: HTTPMethod = .get) {
        self.path = path
        self.method = method
        self.params = nil
        self.headers = nil
    }
    
    fileprivate init(path: String, method: HTTPMethod = .get, params: [String: Any?]?, headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
    
    static func getParams<T:Codable>(from object: T?) -> [String: Any?]? {
        let d = try! JSONEncoder().encode(object)
        let params = try! JSONSerialization.jsonObject(with: d, options: []) as! Dictionary<String, Any>
        return params
    }
    
}

protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
}

extension RequestType {
    
    func execute(onCompletion: @escaping (Result<ResponseType, Error>) -> Void) {
        let dispatcher: NetworkDispatcher = URLSessionNetworkDispatcher.instance 
        AppStateRepository.shared.getToken { token in
            let headers = ["Content-Type" : "application/json",
                           "Authorization" : "Bearer \(token)"]
            print("token: \(token)")
            let dataWithHeaders = RequestData(path: self.data.path, method: self.data.method, params: self.data.params, headers: headers)
            dispatcher.dispatch(
                request: dataWithHeaders,
                onSuccess: { (responseData: Data) in
                    do {
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                        DispatchQueue.main.async {
                            onCompletion(.success(result))
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            onCompletion(.failure(error))
                        }
                    }
            },
                onError: { (error: Error) in
                    DispatchQueue.main.async {
                        onCompletion(.failure(error))
                    }
            }
            )
        }
    }
    
}
