//
//  ErrorResponse.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

struct ErrorResponse: Codable {
    
    let message: String?
    let cod: Int?
    
    static func getMessage(from json: Any?) -> String? {
        let parseError = APIError.parseError("can't parse ErrorResponse").localizedDescription
        guard let json = json as? [String: Any] else {
           return parseError
        }
        do {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else {
                return parseError
            }
            let result = try? JSONDecoder().decode(ErrorResponse.self, from: jsonData)
            return result?.message
        } 
    }
}
