//
//  CitiesViewModel.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation
import RxSwift
import RxCocoa

class CitiesViewModel {

    let citiesItems = BehaviorRelay<[String?]>(value: [])
    var citiesIds: [Int64]?

    init() {
    }

    func loadCities() {
        guard let cities = CityWeatherOperations.shared.listAllCities(), cities.count > 0 else {
            return
        }
        citiesItems.accept(cities.map(){$0.name})
        self.citiesIds = cities.map(){$0.id}
    }
    
    func deleteCity(at index: Int) {
        guard let ids = self.citiesIds, ids.count > 0 else { return }
        CityWeatherOperations.shared.deleteCity(with: ids[index])
        self.citiesIds?.remove(at: index)
        let item = citiesItems.value[index]
        let cities = citiesItems.value.filter { $0 != item}
        citiesItems.accept(cities)
    }
    
}
