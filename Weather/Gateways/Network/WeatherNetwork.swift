//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import RxSwift

public final class WeatherNetwork {
    
    private let request = Request()
    
    init() {
        
    }
    
    func getWeather(for cityName: String) -> Observable<Result<CityWeather, APIError>> {
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            try! self.request.dataTask(with: Router.getWeather(cityName).asURLRequest()) { response, result, error in
                ActivityIndicator.hide()
                let _response = response as? HTTPURLResponse
                guard let statusCode = _response?.statusCode else {return}
                let apiErrorMessage = "\(statusCode): " + (ErrorResponse.getMessage(from: error) ?? ErrorResponse.getMessage(from: result) ?? "unknownError" )
                switch statusCode {
                case 200:
                    let jsonData = try! JSONSerialization.data(withJSONObject: result as! [String: Any], options: .prettyPrinted)
                    let cityWeather = try! JSONDecoder().decode(CityWeather.self, from: jsonData)
                    observer.onNext(.success(cityWeather))
                case 401:
                    observer.onError(APIError.unauthoried(apiErrorMessage))
                case 400 ... 499:
                    observer.onError(APIError.badRequest(apiErrorMessage))
                case 500 ... 599:
                    observer.onError(APIError.serverError(apiErrorMessage))
                default:
                    observer.onError(APIError.unknown(error?.localizedDescription))
                }
            }
            return Disposables.create()
        }
    }
}
