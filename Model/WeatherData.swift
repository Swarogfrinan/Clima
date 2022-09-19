//
//  WeatherMOdel.swift
//  Clima
//
//  Created by Ilya Vasilev on 09.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Weather : Codable {
    let id : Int
    let description : String
}

struct Main : Codable {
    let temp : Double
//    let feels_like : Double
//    let temp_min : Double
//    let temp_max : Double
//    let pressure : Int
//    let humidity : Int
}

//struct Wind : Decodable {
//    let speed : Double
//    let deg : Int
//    let gust : Double
//}
//
//struct Clouds : Decodable {
//    let all : Int
//}
