//
//  WeatherModel.swift
//  Clima
//
//  Created by Ilya Vasilev on 14.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel : Decodable {
    let conditionID: Int
    let cityName : String
    let temperature : Double
    
    var temperatureString : String {
        String(format: "%.1f", temperature)
    }
 
    var conditionName : String {
        switch conditionID {
        case  200...232 :
            return "cloud.bolt"
        case  300...321 :
            return "cloud.drizzle"
        case  500...531 :
            return "cloud.rain.fill"
        case  600...622 :
            return "cloud.snow.fill"
        case  700...781 :
            return "tornado"
        case  800:
            return "clear"
        default : return "cloud"
        }
    }
}
