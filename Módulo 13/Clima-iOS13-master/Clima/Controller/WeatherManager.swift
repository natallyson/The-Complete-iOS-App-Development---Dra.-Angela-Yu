//
//  WeatherManager.swift
//  Clima
//
//  Created by Natallyson Saraiva on 20/10/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

//cria-se o protocolo no mesmo arquivo da classe que irá usar o protocolo
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b3c631553d1ed16c20f00aee35ca236b&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fethWeather  (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1.Criar uma URL
        if let url = URL(string: urlString) {
            //2.Criar uma URLSession
            let session = URLSession(configuration: .default)
            //3.Dê uma tarefa à sessão
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            //4.Comece a tarefa∑?
            task.resume()
        }
    }
    //busca os dados meteorológicos
    func parseJSON (weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
