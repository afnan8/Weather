//
//  WeatherInfo.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation
import CoreData

final class WeatherInfo: NSManagedObject, Identifiable {
    @NSManaged public var descriptionField: String?
    @NSManaged public var humidity: Int64
    @NSManaged public var speed: Float
    @NSManaged public var temp: Float
    @NSManaged public var date: Date
}
