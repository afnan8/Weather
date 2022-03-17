//
//  ResponseComponents.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

public enum ResponseComponents {
    // reponse.
    case result(_ : Any?, _ : HTTPURLResponse?)
    // An error.
    case error(_ : APIError?, _ : HTTPURLResponse?)
}
