//
//  CityRoute.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import UIKit

enum CityRoute: Route {
    
    case addCity(delegate: CitySearch)
    case showCityHistory(id: Int64)
    
    var destination: UIViewController {
        switch self {
        case .addCity(let delegate):
            let viewController: CitySearchViewController = CitiesConfigurator.configure(delegate:delegate)
            return viewController
            
        case .showCityHistory(let id):
            let viewController: CityHistoryViewController = CitiesConfigurator.configure(with: id)
            return viewController
        }
    }
    
    var style: NaivgationStyle {
        switch self {
        default:
            return .modal(transition: nil)
        }
    }
    
}
