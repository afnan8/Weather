//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

public final class WeatherNetwork {
    
    private let request = Request()
    
    init() {
        
    }
    
    func getWeather(for cityName: String, callback: @escaping (ResponseComponents) -> Void )  {
        try! request.dataTask(with: Router.getWeather(cityName).asURLRequest()) { response, data, error in
            ActivityIndicator.hide()
            let _response = response as? HTTPURLResponse
            guard let statusCode = _response?.statusCode else {return}
            let apiErrorMessage = "\(statusCode): " + (ErrorResponse.getMessage(from: error) ?? ErrorResponse.getMessage(from: data) ?? "unknownError" ) 
            switch statusCode {
            case 200:
                callback(.result(data as! [String: Any], response as? HTTPURLResponse))
            case 401:
                callback(.error(.unauthoried(apiErrorMessage), _response))
            case 400 ... 499:
                callback(.error(.badRequest(apiErrorMessage), _response))
            case 500 ... 599:
                callback(.error(.serverError(apiErrorMessage), _response))
            default:
                callback(.error(.unknown(error?.localizedDescription), _response))
            }
        }
    }
}
