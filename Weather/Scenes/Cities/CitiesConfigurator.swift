//
//  CitiesConfigurator.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

class CitiesConfigurator {
    
    static func configure() -> CitiesTableViewController {
        let viewController = CitiesTableViewController()
        viewController.viewModel = CitiesViewModel()
        return viewController
    }
    
    static func configure(delegate: CitySearch) -> CitySearchViewController {
        let viewController = CitySearchViewController()
        let network = WeatherNetwork()
        viewController.viewModel = CityViewModel(network: network, delegate: delegate)
        return viewController
    }
    
    static func configure(with cityId: Int64) -> CityHistoryViewController {
        let viewController = CityHistoryViewController()
        viewController.presenter = CityHistoryPresenter(view: viewController, id: cityId)
//        viewController.viewModel = CityHistoryViewModel(id: cityId)
        return viewController
    }
}
