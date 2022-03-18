//
//  CityHistoryViewModel.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import RxSwift
import RxCocoa
class CityHistoryViewModel {
    
    var id: Int64
    
    let weatherHistory = BehaviorRelay<[WeatherInfo?]>(value: [])
    private let disposeBag = DisposeBag()
    
    init(id: Int64) {
        self.id = id
    }
    
    func getCity() {
        let city = CityWeatherOperations.shared.getCity(with: id)
        city.subscribe { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let city):
                guard let items = city.weatherInfo else {return}
                self.weatherHistory.accept(Array(items))
            case .failure(let error):
                print(error)
            }
        } onError: { error in
            //Alert with error message
            print(error)
        }.disposed(by: disposeBag)

    }
}
