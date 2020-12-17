//
//  WeatherInfoModel.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - WeatherInfo
struct WeatherInfo: Codable {
    let cnt: Int
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let coord: Coord
    let sys: Sys
    let weather: [Weather]
    let main: Main
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
    let timezone, sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}

// MARK: - AddNewCityInformation
class NewCityInfoModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
}

//MARK:- NewCity for getting city from local JSON
struct NewCity: Decodable {
    let id: Int
    let name: String
}

