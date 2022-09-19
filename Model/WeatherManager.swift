//
//  WeatherManager.swift
//  Clima
//
//  Created by Ilya Vasilev on 09.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate : AnyObject {
    func didUpdateWeather(_ weatherManager : WeatherManager, weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManager {
let apiKey = "f48b787b427d0bbc8e34bdc91d3ba91a"
    
let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=f48b787b427d0bbc8e34bdc91d3ba91a&units=metric"
   var delegate: WeatherManagerDelegate?

func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    print(urlString)
    performRequest(urlString: urlString)
    print("User fetch a \(cityName) in textField")
}
    func fetchWeather(latitude : CLLocationDegrees, longtitude : CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longtitude)"
        print(urlString)
        performRequest(urlString: urlString)
        print("User fetch a lat \(latitude) and lon \(longtitude) coordinates in tapp on Button ")
    }
    func performRequest(urlString : String) {
        //1.Create a URl
        if  let url = URL(string: urlString) {
        //2.Perform a url
            let session = URLSession(configuration: .default)
        //3.Give a session to task
          let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        //4.Start the task
    }
}
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            self.delegate?.didFailWithError(error: error!)
            print(error!)
            return
        }
        if let safeData = data {
            if let weather =  self.parseJSON(weatherData: safeData) {
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }

    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather.description)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let weather = WeatherModel.init(conditionID: id, cityName: cityName, temperature: temp)
            print(weather.temperatureString)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    
}

