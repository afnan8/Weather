//
//  Router.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import AFNetworking
import Foundation

enum Router: URLRequestConvertible {
    
    case getWeather(_ cityName: String)
    
    var baseURL: String {
        "https://api.openweathermap.org/"
    }
    
    var endPoint: String {
        switch self {
        case .getWeather:
            return "data/2.5/weather"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? { nil }
    
    var parameters: Parameters? {
        switch self {
        case .getWeather(let cityName):
            return ["q": cityName ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        switch self {
        case .getWeather:
            var components = URLComponents(string: baseURL + endPoint)!
            components.queryItems = parameters?.map { (key, value) in
                URLQueryItem(name: key, value: (value as? String) ?? "")
            }
            let urlQueryItem = URLQueryItem(name: "apikey", value: Constant.apiKey.rawValue)
            components.queryItems?.insert(urlQueryItem, at: 0)
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return makeURLRequest(components.url!)
        }
    }
    
    func makeURLRequest(_ url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
