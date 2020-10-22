//
//  WeatherManager.swift
//  Clima
//
//  Created by Natallyson Saraiva on 20/10/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "api.openweathermap.org/data/2.5/weather?appid=b3c631553d1ed16c20f00aee35ca236b&units=metric"
    
    func fethWeather  (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
