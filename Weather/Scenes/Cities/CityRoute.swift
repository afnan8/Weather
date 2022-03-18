//
//  CityRoute.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import UIKit

enum CityRoute: Route {
    
    case addCity(delegate: CitySearch)

    var destination: UIViewController {
        switch self {
        case .addCity(let delegate):
            let viewController: CitySearchViewController = CitiesConfigurator.configure(delegate:delegate)
            return viewController
        }
    }

    var style: NaivgationStyle {
        switch self {
        case .addCity:
            return .modal(transition: nil)
        }
    }
    
}
