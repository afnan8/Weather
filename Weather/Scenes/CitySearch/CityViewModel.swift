//
//  CityViewModel.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol CitySearch: AnyObject {
    func isAdded()
}

class CityViewModel {

    let isfinished = PublishSubject<Bool>()

    private let disposeBag = DisposeBag()
    private let network: WeatherNetwork
    private let delegate: CitySearch?
    
    init(network: WeatherNetwork, delegate: CitySearch) {
        self.network = network
        self.delegate = delegate
    }

    func fetchWeather(for cityName: String) {
        network.getWeather(for: cityName).subscribe { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let cityWeather):
                CityWeatherOperations.shared.save(cityWeather: cityWeather)
                self.isfinished.on(.next(true))
                self.delegate?.isAdded()
            case .failure(let error):
                print(error)
            }
        } onError: { error in
            //Alert with error message
            print(error)
        }.disposed(by: disposeBag)
    }
}
