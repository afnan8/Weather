//
//  WeatherInformation.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import Foundation
import CoreData

struct CityItem {
    
    var name: String?
    var weatherInformation = [WeatherInformation]()
   
    init(_ city: City) {
        self.name = city.name
        guard let weatherInfo = city.weatherInfo else {return}
        let items = Array(weatherInfo)
        for item in items {
            weatherInformation.append(WeatherInformation(item))
        }
    }
}

struct WeatherInformation {
    
    var descriptionField: String?
    var humidity: Int64
    var speed: Float
    var temp: Float
    var date: Date
    
    init(_ weatherInfo: WeatherInfo) {
        self.descriptionField = weatherInfo.descriptionField
        self.humidity = weatherInfo.humidity
        self.speed = weatherInfo.speed
        self.temp = weatherInfo.temp
        self.date = weatherInfo.date
    }
}
