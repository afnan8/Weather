//
//  Date+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import Foundation

extension Date {

    func convertDateToString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
