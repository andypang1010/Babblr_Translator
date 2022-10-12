//
//  Network Manager.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/10.
//

import Foundation

struct NetworkManager {
    static let api = "https://api-free.deepl.com/v2/"
    static let defaultSession = URLSession(configuration: .default)
    
    static var decoder : JSONDecoder = {
        let dec = JSONDecoder()
        dec.dataDecodingStrategy = .base64
        return dec
    }()
    
    enum RequestType: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum RequestError: Error {
        case notFound
        case badRequest
        case uncategorized
        case decodingError
    }
    
//    private static func networkRequest(route: String = "",
//                                       requestType: RequestType,
//                                       parameters: [CustomStringConvertible],
//                                       content: String,
//                                       completionHandler: @escaping (Result<DecodingType, RequestError>) -> Void
//    ) throws {
//        
//    }
}
