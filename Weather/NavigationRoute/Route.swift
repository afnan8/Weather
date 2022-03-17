//
//  Route.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import UIKit

protocol Route {
    var destination: UIViewController { get }
    var style: NaivgationStyle { get }
}

enum NaivgationStyle {
    case modal(transition: UIModalTransitionStyle?)
    case push
}
