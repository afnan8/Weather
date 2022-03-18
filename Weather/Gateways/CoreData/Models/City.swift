//
//  City.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation
import CoreData

final class City: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var weatherInfo: Set<WeatherInfo>?
}
