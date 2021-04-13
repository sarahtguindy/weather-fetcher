//
//  Launch.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import Foundation

struct Weather: Codable {
    
    var currentTempurature: Double
    var currentFeelsLike: Double
    var currentWind: Double
    var currentDirection: String
    var currentUVIndex: Double
    
    var currentDay: Int
    
    init() {
        self.currentTempurature = 0.0
        self.currentFeelsLike = 0.0
        self.currentWind = 0.0
        self.currentDirection = ""
        self.currentUVIndex = 0.0
        self.currentDay = 0
    }
    
    enum CodingKeys : String, CodingKey {
        case currentTempurature = "temp_c"
        case currentFeelsLike = "feelslike_c"
        case currentWind = "wind_kph"
        case currentDirection = "wind_dir"
        case currentUVIndex = "uv"
        case current = "current"
        case currentDay = "is_day"
    }
    
    func encode(to encoder: Encoder) throws { }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        let currentContainer = try response.decodeIfPresent(CurrentWeather.self, forKey: .current)
        
        self.currentTempurature = currentContainer?.temp_c ?? 0.0
        self.currentFeelsLike = currentContainer?.feelslike_c ?? 0.0
        self.currentWind = currentContainer?.wind_kph ?? 0.0
        self.currentDirection = currentContainer?.wind_dir ?? "N/A"
        self.currentUVIndex = currentContainer?.uv ?? 0.0
        self.currentDay = currentContainer?.is_day ?? 0
    }
    
}

struct CurrentWeather: Codable {
    
    let temp_c: Double?
    let feelslike_c: Double?
    let wind_kph: Double?
    let wind_dir: String
    let uv: Double?
    let is_day: Int?
    
    enum CodingKeys : String, CodingKey {
        case temp_c = "temp_c"
        case feelslike_c = "feelslike_c"
        case wind_kph = "wind_kph"
        case wind_dir = "wind_dir"
        case uv = "uv"
        case is_day = "is_day"
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp_c = try response.decodeIfPresent(Double.self, forKey: .temp_c)
        self.feelslike_c = try response.decodeIfPresent(Double.self, forKey: .feelslike_c)
        self.wind_kph = try response.decodeIfPresent(Double.self, forKey: .wind_kph)
        self.wind_dir = try response.decodeIfPresent(String.self, forKey: .wind_dir) ?? "N/A"
        self.uv = try response.decodeIfPresent(Double.self, forKey: .uv)
        self.is_day = try response.decodeIfPresent(Int.self, forKey: .is_day)
    }
    
    func encode(to encoder: Encoder) throws { }
    
}
