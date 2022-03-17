//
//  City.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

struct CityList: Codable {

    let base: String?
    let clouds: Cloud?
    let cod: Int?
    let coord: Coord?
    let dt: Int?
    let id: Int?
    let main: Main?
    let name: String?
    let sys: Sy?
    let timezone: Int?
    let visibility: Int?
    let weather: [Weather]?
    let wind: Wind?

    func encode(to encoder: Encoder) throws {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case base = "base"
        case clouds
        case cod = "cod"
        case coord
        case dt = "dt"
        case id = "id"
        case main
        case name = "name"
        case rain
        case sys
        case timezone = "timezone"
        case visibility = "visibility"
        case weather = "weather"
        case wind
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        clouds = try Cloud(from: decoder)
        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
        coord = try Coord(from: decoder)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try Main(from: decoder)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sys = try Sy(from: decoder)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        wind = try Wind(from: decoder)
    }
}

struct Wind: Codable {

    let deg: Int?
    let speed: Float?


    enum CodingKeys: String, CodingKey {
        case deg = "deg"
        case speed = "speed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
        speed = try values.decodeIfPresent(Float.self, forKey: .speed)
    }
}
struct Weather: Codable {

    let descriptionField: String?
    let icon: String?
    let id: Int?
    let main: String?


    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case icon = "icon"
        case id = "id"
        case main = "main"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
    }
}

struct Sy: Codable {

    let country: String?
    let id: Int?
    let sunrise: Int?
    let sunset: Int?
    let type: Int?

    enum CodingKeys: String, CodingKey {
        case country = "country"
        case id = "id"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
    }
}

struct Main: Codable {

    let feelsLike: Float?
    let humidity: Int?
    let pressure: Int?
    let temp: Float?
    let tempMax: Float?
    let tempMin: Float?


    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case humidity = "humidity"
        case pressure = "pressure"
        case temp = "temp"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feelsLike = try values.decodeIfPresent(Float.self, forKey: .feelsLike)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        temp = try values.decodeIfPresent(Float.self, forKey: .temp)
        tempMax = try values.decodeIfPresent(Float.self, forKey: .tempMax)
        tempMin = try values.decodeIfPresent(Float.self, forKey: .tempMin)
    }
}

struct Coord: Codable {

    let lat: Float?
    let lon: Float?


    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lon = try values.decodeIfPresent(Float.self, forKey: .lon)
    }
}
struct Cloud: Codable {

    let all: Int?

    enum CodingKeys: String, CodingKey {
        case all = "all"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(Int.self, forKey: .all)
    }
}
