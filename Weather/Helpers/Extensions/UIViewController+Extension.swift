//
//  UIViewController+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

protocol NavigationRoute {
    func navigate(to route: Route)
}

extension UIViewController: NavigationRoute {
    
    func navigate(to route: Route) {
        switch route.style {
        case .modal:
            self.present(route.destination, animated: true, completion: nil)
        case .push:
            self.navigationController?.pushViewController(route.destination, animated: true)
        }
    }
}
