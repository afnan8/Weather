//
//  CityWeather.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

struct CityWeather: Codable {

    let base: String?
    let clouds: Cloud?
    let cod: Int?
    let coord: Coord?
    let dt: Int?
    let id: Int64?
    let main: Main?
    let name: String?
    let sys: Sy?
    let timezone: Int?
    let visibility: Int?
    let weather: [Weather]?
    let wind: Wind?

}

struct Wind: Codable {

    let deg: Int?
    let speed: Float?
}
struct Weather: Codable {

    let descriptionField: String?
    let icon: String?
    let id: Int?
    let main: String?
}

struct Sy: Codable {

    let country: String?
    let id: Int?
    let sunrise: Int?
    let sunset: Int?
    let type: Int?

}

struct Main: Codable {

    let feelsLike: Float?
    let humidity: Int64?
    let pressure: Int?
    let temp: Float?
    let tempMax: Float?
    let tempMin: Float?
}

struct Coord: Codable {

    let lat: Float?
    let lon: Float?
}
struct Cloud: Codable {

    let all: Int?
}
