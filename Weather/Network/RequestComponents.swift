//
//  HTTPMethod.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

public protocol HTTPRequest {
    var baseURL: String { get }
    var endPoint: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
}

public protocol URLRequestConvertible: HTTPRequest {
    func asURLRequest() throws -> URLRequest
}

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String : Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

