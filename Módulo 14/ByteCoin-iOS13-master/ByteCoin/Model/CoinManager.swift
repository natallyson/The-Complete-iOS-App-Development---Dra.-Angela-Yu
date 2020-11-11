//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
    
    //Por convenção, os protocolos em Swift são escritos no arquivo que contem a classe / estrutura que irá chamar o delegate.
    //Protocolo criado para passar o último preço do bitcoin.
    protocol CoinManagerDelegate {
        
        //Metodo delegate para atualizar o preço do bitcoin.
        func didUpdatePrice(price: String, currency: String)
        
        //Metodo delegate para passar quaisquer erros.
        func didFailWithError(error: Error)
    }
    
    struct CoinManager {
        
        //Delegate opcional que implementará os métodos de delegado.
        var delegate: CoinManagerDelegate?
        
        let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
        let apiKey = "3DC42FAD-06AA-4772-B885-8CC80574286C"
        
        let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
        
        func getCoinPrice(for currency: String) {
            //Contatenando a String para adicionar a moeda selecionada.
            let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
            
            //Usando opcional para desembrulhar a URL criada apartir da String.
            if let url = URL(string: urlString) {
                
                //Criando um novo Objeto URLSession com configuração padrão.
                let session = URLSession(configuration: .default)
                
                //Criando uma nova tarefa de dados para URLSession.
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }
                    if let safeData = data {
                    
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        //Arredondando para 2 casas decimais.
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        //Chama o método delegate no ViewController e repassa os dados necessários.
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
                //Inicia a tarefa para buscar os dados no servidor.
                task.resume()
            }
        }
        
        func parseJSON(_ data: Data) -> Double? {
            
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(CoinData.self, from: data)
                let lastPrice = decodedData.rate
                print(lastPrice)
                return lastPrice
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
    }
